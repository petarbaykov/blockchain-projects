// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenB is ERC20 { // 0x08ef99FC8eadf2D9A125307a0298c070055279a3
    constructor(uint256 _totalSupply) ERC20("TokenB", "TKNB") {
        _mint(msg.sender, _totalSupply * (10 ** 18));
    }
}