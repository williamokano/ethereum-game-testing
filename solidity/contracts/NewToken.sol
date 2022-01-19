// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.11;

import "openzeppelin-solidity/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";

contract NewToken is ERC1155PresetMinterPauser {
    
    uint256 public constant PUMP_TALISMAN = 1;
    uint256 public constant SUPERBOOTS = 2;
    uint256 public constant TIMEWARP_CAPE = 3;

    constructor() ERC1155PresetMinterPauser("https://okano.dev/ethergamepoc/{id}.json") {

    }
}