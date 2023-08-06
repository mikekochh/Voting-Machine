// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PresidentalCandidate} from "./PresidentalCandidate.sol";

contract PresidentalCandidateFactory {
    PresidentalCandidate[] public listOfPresidentalCandidates;

    function createPresidentalCandidateContract(
        string memory _candidateName,
        PresidentalCandidate.PoliticalParty _politicalParty
    ) public returns (PresidentalCandidate) {
        PresidentalCandidate presidentalCandidate = new PresidentalCandidate(_candidateName, _politicalParty);
        listOfPresidentalCandidates.push(presidentalCandidate);
        return presidentalCandidate;
    }
}
