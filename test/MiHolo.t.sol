// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MiHolo.sol";

contract MiHoloTest is Test {
    MiHolo public miHolo;

    function setUp() public {
        miHolo = new MiHolo();
    }

    function testReceiveFail(){

    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
