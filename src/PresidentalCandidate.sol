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

contract PresidentalCandidate {
    enum PoliticalParty {
        Republican,
        Democrat
    }

    string private s_candidateName;
    uint256 private s_NumberOfVotes;
    PoliticalParty private immutable i_politicalParty;

    constructor(string memory _candidateName, PoliticalParty _politicalParty) {
        s_candidateName = _candidateName;
        s_NumberOfVotes = 0;
        i_politicalParty = _politicalParty;
    }

    // how do I make it so this function is only called when the voting machine vote function is called?
    function addVote() public {
        s_NumberOfVotes++;
    }

    function getCandidateName() public view returns (string memory) {
        return s_candidateName;
    }

    function getNumberOfVotes() public view returns (uint256) {
        return s_NumberOfVotes;
    }
}
