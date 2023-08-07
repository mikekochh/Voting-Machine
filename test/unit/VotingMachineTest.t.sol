// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {PresidentalCandidateFactory} from "../../src/PresidentalCandidateFactory.sol";
import {PresidentalCandidate} from "../../src/PresidentalCandidate.sol";
import {VotingMachine} from "../../src/VotingMachine.sol";

contract VotingMachineTest is Test {
    VotingMachine votingMachine = new VotingMachine();
    PresidentalCandidateFactory presidentalCandidateFactory = new PresidentalCandidateFactory();
    PresidentalCandidate donaldTrump;
    PresidentalCandidate joeBiden;
    address public voter = makeAddr("USER");

    string public candidateNameTrump = "Donald Trump";
    string public candidateNameBiden = "Joe Biden";

    string public pictureURI = "temporary";

    modifier voterVotesForTrump() {
        vm.prank(address(votingMachine));
        votingMachine.vote(address(donaldTrump));
        _;
    }

    function setUp() public {
        donaldTrump = presidentalCandidateFactory.createPresidentalCandidateContract(
            candidateNameTrump, PresidentalCandidate.PoliticalParty.Republican, pictureURI
        );
        joeBiden = presidentalCandidateFactory.createPresidentalCandidateContract(
            candidateNameBiden, PresidentalCandidate.PoliticalParty.Democrat, pictureURI
        );
        donaldTrump.transferOwnership(address(votingMachine));
        joeBiden.transferOwnership(address(votingMachine));
    }

    function testIfPresidentalCandidateGainedAVote() public voterVotesForTrump {
        assertEq(donaldTrump.getNumberOfVotes(), 1);
    }

    function testRevertIfOwnerDoesNotCallVoteFunction() public {}
}
