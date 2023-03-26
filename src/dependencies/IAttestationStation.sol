// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Semver} from "../Semver.sol";

interface IAttestationStation {

    struct AttestationData {
        address about;
        bytes32 key;
        bytes val;
    }

    function attest(address _about, bytes32 _key, bytes memory _val) external;

    function attest(AttestationData[] calldata _attestations) external;
}
