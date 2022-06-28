// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Stake is Ownable { 
    IERC20 private _stakeToken;
    IERC20 private _rewardToken;

    constructor(address stakeToken, address rewardToken) {
        _stakeToken = IERC20(stakeToken);
        _rewardToken = IERC20(rewardToken);
    }

    function stake(uint256 _amount) public {
        // _stakeToken.approve(address(this), _amount);
        // _stakeToken.transferFrom(msg.sender, address(this), _amount);

        // TODO: track staked balances
        _stakeToken.transfer(address(this), _amount);
    }

    function withdraw() public {
        // TODO: calculate rewards
        // TODO: return staked balance
    }
}
