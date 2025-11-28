// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {OccasionContract} from "../src/OccasionContract.sol";
import {AonERC20} from "./mocks/AonERC20.sol";

contract OccasionContractTest is Test {
    OccasionContract public occasion;
    AonERC20 public aonToken;
    address public creator = address(this);

    function setUp() public {
        uint256 initialSupply = 1000e18; 
        occasion = new OccasionContract(initialSupply, creator);
        aonToken = new AonERC20();
    }

    function attendanceTest() public {
        uint256 amount = 10e18;
        aonToken.approve(address(occasion), amount);
        bool attendancePassed = occasion.attendOccasion(amount, address(aonToken));
        assertTrue(attendancePassed);
    }
}