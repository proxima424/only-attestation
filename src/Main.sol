// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

//interfaces
import {IAttestationStation} from "./dependencies/IAttestationStation.sol";

//dependency
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract Main is Ownable {
    // STORAGE VARIABLES
    IAttestationStation public registry;

    // STRUCTS
    struct AttestationData {
        address about;
        bytes32 key;
        bytes val;
    }

    constructor(IAttestationStation _registry) {
        registry = _registry;
    }
}
