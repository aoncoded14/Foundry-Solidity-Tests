// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

error TransferFailed();

contract OccasionContract is ERC20, Ownable {

    mapping(address => mapping(address => uint256)) public occ_balances;
    
    constructor(uint256 initialSupply, address _creator)
        ERC20("USDollar-A", "USDA")
        Ownable(_creator)
    {
        _mint(msg.sender, initialSupply);
    }
    

    function attendOccasion(uint256 _price, address _token) external returns(bool) {
        occ_balances[msg.sender] [_token] += _price;
        bool success = ERC20(_token).transferFrom(msg.sender, address(this), _price);
        if(!success) revert TransferFailed;
        return success;
    }

}