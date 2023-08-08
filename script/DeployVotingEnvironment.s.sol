// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {PresidentalCandidateFactory} from "../src/PresidentalCandidateFactory.sol";
import {PresidentalCandidate} from "../src/PresidentalCandidate.sol";
import {VotingMachine} from "../src/VotingMachine.sol";

contract DeployVotingMachine is Script {
    function run() external returns (VotingMachine) {
        vm.startBroadcast();
        VotingMachine votingMachine = new VotingMachine();
        vm.stopBroadcast();
        return votingMachine;
    }
}

// contract DeployPresidentialCandidates is Script {
//     function run() external returns (PresidentalCandidate memory []) {}
// }
