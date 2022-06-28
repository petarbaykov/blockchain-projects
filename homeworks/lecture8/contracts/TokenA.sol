// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenA is ERC20 { // 0x29f0d089B092eE7497B1465b84D383F312A8fbfB
    constructor(uint256 _totalSupply) ERC20("TokenA", "TKNA") {
        _mint(msg.sender, _totalSupply * (10 ** 18));
    }
}