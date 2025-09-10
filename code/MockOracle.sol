// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/access/Ownable.sol";

contract MockOracle is Ownable {
    uint256 private _price; // scaled 1e18

    constructor(uint256 initialPrice) Ownable(msg.sender) {
        _price = initialPrice;
    }

    function setPrice(uint256 newPrice) external onlyOwner {
        _price = newPrice;
    }

    function getPrice() external view returns (uint256) {
        return _price;
    }
}
