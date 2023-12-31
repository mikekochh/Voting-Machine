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

contract VotingMachine {
    error VotingMachine__PersonHasAlreadyVoted();

    mapping(address voter => bool hasVoted) hasVoterVoted;

    modifier hasPersonVoted(address _personVoting) {
        if (hasVoterVoted[_personVoting]) {
            revert VotingMachine__PersonHasAlreadyVoted();
        }
        _;
    }

    function vote(address candidate) public hasPersonVoted(msg.sender) {
        PresidentalCandidate(candidate).addVote();
        hasVoterVoted[msg.sender] = true;
    }
}
