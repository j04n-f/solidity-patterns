// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Mutex} from "../src/Mutex.sol";

contract Attacker {
    Mutex public bank;

    constructor(address _bank) {
        bank = Mutex(_bank);
    }

    fallback() external payable {
        if (address(bank).balance >= 1 ether) {
            bank.withdraw(1 ether);
        }
    }

    receive() external payable {
        if (address(bank).balance >= 1 ether) {
            bank.withdraw(1 ether);
        }
    }

    function attack() external payable {
        bank.deposit{value: 10 ether}();
        bank.withdraw(1 ether);
    }
}


contract MutexTest is Test {
    Mutex public bank;

    function setUp() public {
        bank = new Mutex();
        bank.deposit{value: 10 ether}();
    }

    function test_Deposit() public view {
        assertEq(bank.balance(address(this)), 10 ether);
        assertEq(address(bank).balance, 10 ether);
    }

    function test_Withdraw() public {
        bank.withdraw(2 ether);
        assertEq(bank.balance(address(this)), 8 ether);
        assertEq(address(bank).balance, 8 ether);
    }

    function test_RevertWhen_WithdrawIsLocke() public {
        Attacker attacker = new Attacker(address(bank));
        vm.expectRevert(abi.encodeWithSelector(Mutex.TransactionError.selector, "No re-entrancy"));
        attacker.attack{value: 10 ether}();
    }

    function test_RevertWhen_InsufficientBalance() public {
        vm.expectRevert(abi.encodeWithSelector(Mutex.InsufficientBalance.selector, 12 ether, 10 ether));
        bank.withdraw(12 ether);
    }

    function test_RevertWhen_InvalidAmount() public {
        vm.expectRevert(Mutex.InvalidAmount.selector);
        bank.withdraw(0 ether);
    }

    receive() external payable {}
}