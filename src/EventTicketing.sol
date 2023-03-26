// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

//interfaces
import {IAttestationStation} from "./dependencies/IAttestationStation.sol";

//dependency
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract EventTicketing is Ownable {

    // STORAGE VARIABLES
    address public registry;
    bytes32[] public attestation_keys;
    bytes public attestation_val_true = "True";
    bytes public attestation_val_false = "False";

    // STRUCTS
    struct AttestationData {
        address about;
        bytes32 key;
        bytes val;
    }

    constructor(address _registry, bytes32[] memory _keys) {
        registry = _registry;
        attestation_keys = _keys;
    }

    function _setTicketingRight(address attendee, bytes32 _key, bytes memory _val ) internal {
        IAttestationStation(registry).attest(attendee,_key,_val);
    }

    function giveTicketingRight(address attendee, uint256 index_key ) public onlyOwner{
        _setTicketingRight(attendee,attestation_keys[index_key],attestation_val_true);
    }

    function removeTicketingRight(address attendee, uint256 index_key) public onlyOwner{
        _setTicketingRight(attendee,attestation_keys[index_key],attestation_val_false);
    }


}