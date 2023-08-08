// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {PresidentalCandidateFactory} from "../../src/PresidentalCandidateFactory.sol";
import {PresidentalCandidate} from "../../src/PresidentalCandidate.sol";
import {VotingMachine} from "../../src/VotingMachine.sol";

contract VotingMachineTest is Test {
    error VotingMachine__PersonHasAlreadyVoted();

    VotingMachine votingMachine = new VotingMachine();
    PresidentalCandidateFactory presidentalCandidateFactory = new PresidentalCandidateFactory();
    PresidentalCandidate donaldTrump;
    PresidentalCandidate joeBiden;
    address public voter = makeAddr("USER");

    string public candidateNameTrump = "Donald Trump";
    string public candidateNameBiden = "Joe Biden";

    string public pictureURI = "temporary";

    modifier voterVotesForTrump() {
        vm.prank(voter);
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
        vm.startPrank(address(presidentalCandidateFactory));
        donaldTrump.transferOwnership(address(votingMachine));
        joeBiden.transferOwnership(address(votingMachine));
        vm.stopPrank();
    }

    function testIfPresidentalCandidateGainedAVote() public voterVotesForTrump {
        assertEq(donaldTrump.getNumberOfVotes(), 1);
    }

    function testExpectRevertIfVoterHasAlreadyVotedAndVotesAgain() public voterVotesForTrump {
        vm.expectRevert(VotingMachine__PersonHasAlreadyVoted.selector);
        vm.prank(voter);
        votingMachine.vote(address(donaldTrump));
    }
}
