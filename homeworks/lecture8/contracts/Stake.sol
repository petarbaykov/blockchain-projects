// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Stake is Ownable { 
    IERC20 private _stakeToken;
    IERC20 private _rewardToken;

    mapping(address => uint256) public staked_balances;


    constructor(address stakeToken, address rewardToken) {
        _stakeToken = IERC20(stakeToken);
        _rewardToken = IERC20(rewardToken);
    }

    function stake(uint256 _amount) public returns(uint256) {
        require(_amount > 0, "Amount not positive");
        require(_stakeToken.allowance(msg.sender, address(this) >= _amount), "Token transfer not approved");
    
        _stakeToken.transferFrom(msg.sender, address(this), _amount);
        staked_balances[msg.sender] += _amount;
    }

    function withdraw() public {
        require(staked_balances[msg.sender] > 0, "Noting to withdraw");

        _stakeToken.transfer(msg.sender, staked_balances[msg.sender]);
        staked_balances[msg.sender] = 0;
    }

    function claim() public {
        // TODO: calculate and distribute stake rewards
    }
}
