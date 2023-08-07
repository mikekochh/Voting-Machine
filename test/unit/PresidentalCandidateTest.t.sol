// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {PresidentalCandidateFactory} from "../../src/PresidentalCandidateFactory.sol";
import {PresidentalCandidate} from "../../src/PresidentalCandidate.sol";

contract PresidentalCandidateTest is Test {
    PresidentalCandidateFactory presidentalCandidateFactory = new PresidentalCandidateFactory();
    PresidentalCandidate donaldTrump;
    PresidentalCandidate joeBiden;

    string public candidateNameTrump = "Donald Trump";
    string public candidateNameBiden = "Joe Biden";

    string public pictureUri = "testing";

    function setUp() public {
        donaldTrump = presidentalCandidateFactory.createPresidentalCandidateContract(
            candidateNameTrump, PresidentalCandidate.PoliticalParty.Republican, pictureUri
        );
        joeBiden = presidentalCandidateFactory.createPresidentalCandidateContract(
            candidateNameBiden, PresidentalCandidate.PoliticalParty.Democrat, pictureUri
        );
    }

    function testCandidateHasZeroVotesWhenCreated() public {
        assertEq(donaldTrump.getNumberOfVotes(), 0);
    }

    function testCandidateNameIsCorrectWhenCreated() public {
        assertEq(
            keccak256(abi.encodePacked(donaldTrump.getCandidateName())), keccak256(abi.encodePacked(candidateNameTrump))
        );
    }
}
