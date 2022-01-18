// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.11;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {
    constructor (string memory _name, string memory _symbol, uint8 _decimals) ERC20(_name, _symbol) {

    }

    function mint(address to, uint256 value) public returns (bool) {
        _mint(to, value);
        return true;
    }
}