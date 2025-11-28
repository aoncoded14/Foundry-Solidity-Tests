// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AonERC20 is ERC20 {
    constructor() ERC20("Aon US Dollar", "USDA") {
        _mint(msg.sender, 1000000e18);
    }
}