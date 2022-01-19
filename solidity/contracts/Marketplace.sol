// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.11;

import "openzeppelin-solidity/contracts/token/ERC1155/IERC1155.sol";
import "openzeppelin-solidity/contracts/token/ERC1155/utils/ERC1155Receiver.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";

contract Marketplace is Ownable, ERC1155Receiver {
    IERC1155 private _token;

    function tokenAddress() external view returns (address) {
        return address(_token);
    }

    // id => price
    mapping(uint256 => uint256) _price;

    constructor(IERC1155 token) {
        require(address(token) != address(0));
        _token = token;

        _price[1] = 0.001 ether;
        _price[2] = 0.002 ether;
        _price[3] = 0.003 ether;
    }

    function price(uint256 _id) external view returns (uint256) {
        return _price[_id];
    }

    fallback() external payable {
        buyToken(1);
    }

    receive() external payable {
        buyToken(1);
    }

    function buyToken(uint256 _tokenId) public payable {
        uint256 weiAmount = msg.value;
        require(weiAmount >= _price[_tokenId] && _price[_tokenId] != 0, "not enough balance or token not exist");

        _token.safeTransferFrom(address(this), msg.sender, _tokenId, 1, "");
    }

    function withdrawEther(address payable _to) external payable onlyOwner {
        require(address(this).balance > 0, "no funds to withdral");

        _to.transfer(address(this).balance);
    }

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes calldata
    ) external returns (bytes4) {
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] calldata,
        uint256[] calldata,
        bytes calldata
    ) external returns (bytes4) {
        return bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"));
    }
}
