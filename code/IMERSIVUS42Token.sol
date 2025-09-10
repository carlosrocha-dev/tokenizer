// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// OpenZeppelin via GitHub (funciona no Remix)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/access/Ownable.sol";

/// @title IMERSIVUS42 Token (BEP-20 compatível ERC-20)
contract IMERSIVUS42Token is ERC20, Ownable {
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialSupply
    ) ERC20(name_, symbol_) Ownable(msg.sender) {
        _mint(msg.sender, initialSupply); // ex.: 1_000_000 * 1e18
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
