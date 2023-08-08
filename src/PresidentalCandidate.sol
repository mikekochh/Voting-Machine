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

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol"; // forge install OpenZeppelin/openzeppelin-contracts --no-commit

contract PresidentalCandidate is Ownable {
    enum PoliticalParty {
        Republican,
        Democrat
    }

    string private s_candidateName;
    string private s_candidatePictureUri;
    uint256 private s_NumberOfVotes;
    PoliticalParty private immutable i_politicalParty;

    constructor(string memory _candidateName, PoliticalParty _politicalParty, string memory _candidatePictureUri) {
        s_candidateName = _candidateName;
        s_NumberOfVotes = 0;
        s_candidatePictureUri = _candidatePictureUri;
        i_politicalParty = _politicalParty;
    }

    function addVote() external onlyOwner {
        s_NumberOfVotes++;
    }

    function getCandidateName() public view returns (string memory) {
        return s_candidateName;
    }

    function getNumberOfVotes() public view returns (uint256) {
        return s_NumberOfVotes;
    }

    function getCandidatePictureURI() public view returns (string memory) {
        return s_candidatePictureUri;
    }
}
