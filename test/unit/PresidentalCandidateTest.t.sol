// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {PresidentalCandidateFactory} from "../../src/PresidentalCandidateFactory.sol";
import {PresidentalCandidate} from "../../src/PresidentalCandidate.sol";
import {VotingMachine} from "../../src/VotingMachine.sol";

contract PresidentalCandidateTest is Test {
    PresidentalCandidateFactory presidentalCandidateFactory = new PresidentalCandidateFactory();
    PresidentalCandidate donaldTrump;
    PresidentalCandidate joeBiden;

    function setUp() public {
        donaldTrump = presidentalCandidateFactory.createPresidentalCandidateContract(
            "Donald Trump", PresidentalCandidate.PoliticalParty.Republican
        );
        joeBiden = presidentalCandidateFactory.createPresidentalCandidateContract(
            "Joe Biden", PresidentalCandidate.PoliticalParty.Democrat
        );
    }

    function testCandidateHasZeroVotesWhenCreated() public {
        assertEq(donaldTrump.getNumberOfVotes(), 0);
    }

    function testVotingIncrementsNumberOfVotes() public {}
}
