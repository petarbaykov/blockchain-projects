// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyCustomToken is ERC20, Ownable {
    uint256 public lastMinted;

    error MintNotAllowed();

    constructor(uint256 _initialSupply) ERC20("My Custom Token", "MCT") {
        _mint(msg.sender, _initialSupply);
    }

    function mint(uint256 _amount) public onlyOwner {
        if (block.timestamp - lastMinted < 1 days) {
            revert MintNotAllowed();
        }
        lastMinted = block.timestamp;
        _mint(owner(), _amount);
    }
}
