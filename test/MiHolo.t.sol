// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MiHolo.sol";

interface CheatCodes {
    function prank(address, address) external;

    // Sets the *next* call's msg.sender to be the input address, and the tx.origin to be the second input
    function prank(address) external;

    // Sets the *next* call's msg.sender to be the input address
    function assume(bool) external;

    // When fuzzing, generate new inputs if conditional not met
    function deal(address who, uint256 newBalance) external;
    // Sets an address' balance
}

contract MiHoloTest is Test {
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
    MiHolo public miHolo;
    address ownerAddress = 0xA9e095A27CF64DFD0a8a8C3ecAA9C92039c7d2E6;

    function sendViaCall(address payable _to, uint256 _amt) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: _amt}("");
        require(sent, "Failed to send Ether");
    }

    function setUp() public {
        miHolo = new MiHolo();
    }

    function testFailBuy() public{
    cheats.prank(address(1));
    cheats.deal(address(1), 1 ether);
    sendViaCall(payable(miHolo), 0.2 ether);
    }

    function testBuy1() public{
    cheats.prank(address(1));
    cheats.deal(address(1), 1 ether);
    sendViaCall(payable(miHolo), 0.18 ether);
    //emit log_uint(miHolo.sold());
    assertEq(miHolo.sold(), 1);
    }

    function testBuy3() public{
    cheats.prank(address(1));
    cheats.deal(address(1), 1 ether);
    sendViaCall(payable(miHolo), 0.5 ether);
    //emit log_uint(miHolo.sold());
    assertEq(miHolo.sold(), 3);
    }

    function testBuy10() public{
    cheats.prank(address(1));
    cheats.deal(address(1), 2 ether);
    sendViaCall(payable(miHolo), 1.5 ether);
    //emit log_uint(miHolo.sold());
    assertEq(miHolo.sold(), 10);
    }

    function testFailTransfer() public {
        cheats.deal(address(miHolo), 5 ether);
        miHolo.transferETH(payable(address(1)), 4 ether);
    }

    function testTransfer() public {
        cheats.deal(address(miHolo), 5 ether);
        cheats.prank(ownerAddress);
        miHolo.transferETH(payable(address(1)), 4 ether);
    }

    function testSellOut() public {
        cheats.prank(address(1));
        cheats.deal(address(1), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(2));
        cheats.deal(address(2), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(3));
        cheats.deal(address(3), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(4));
        cheats.deal(address(4), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(5));
        cheats.deal(address(5), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(6));
        cheats.deal(address(6), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(7));
        cheats.deal(address(7), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(8));
        cheats.deal(address(8), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(9));
        cheats.deal(address(9), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(10));
        cheats.deal(address(10), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(11));
        cheats.deal(address(11), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(12));
        cheats.deal(address(12), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(13));
        cheats.deal(address(13), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(14));
        cheats.deal(address(14), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(15));
        cheats.deal(address(15), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(16));
        cheats.deal(address(16), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(17));
        cheats.deal(address(17), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(18));
        cheats.deal(address(18), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        assertEq(miHolo.sold(), 180);
    }

    function testFailSellOut1() public {
        cheats.prank(address(1));
        cheats.deal(address(1), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(2));
        cheats.deal(address(2), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(3));
        cheats.deal(address(3), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(4));
        cheats.deal(address(4), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(5));
        cheats.deal(address(5), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(6));
        cheats.deal(address(6), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(7));
        cheats.deal(address(7), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(8));
        cheats.deal(address(8), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(9));
        cheats.deal(address(9), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(10));
        cheats.deal(address(10), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(11));
        cheats.deal(address(11), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(12));
        cheats.deal(address(12), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(13));
        cheats.deal(address(13), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(14));
        cheats.deal(address(14), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(15));
        cheats.deal(address(15), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(16));
        cheats.deal(address(16), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(17));
        cheats.deal(address(17), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(18));
        cheats.deal(address(18), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(19));
        cheats.deal(address(19), 2 ether);
        sendViaCall(payable(miHolo), 0.18 ether);
    }

        function testFailSellOut3() public {
        cheats.prank(address(1));
        cheats.deal(address(1), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(2));
        cheats.deal(address(2), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(3));
        cheats.deal(address(3), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(4));
        cheats.deal(address(4), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(5));
        cheats.deal(address(5), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(6));
        cheats.deal(address(6), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(7));
        cheats.deal(address(7), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(8));
        cheats.deal(address(8), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(9));
        cheats.deal(address(9), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(10));
        cheats.deal(address(10), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(11));
        cheats.deal(address(11), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(12));
        cheats.deal(address(12), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(13));
        cheats.deal(address(13), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(14));
        cheats.deal(address(14), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(15));
        cheats.deal(address(15), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(16));
        cheats.deal(address(16), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(17));
        cheats.deal(address(17), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(18));
        cheats.deal(address(18), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(19));
        cheats.deal(address(19), 2 ether);
        sendViaCall(payable(miHolo), 0.5 ether);
    }

        function testFailSellOut10() public {
        cheats.prank(address(1));
        cheats.deal(address(1), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(2));
        cheats.deal(address(2), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(3));
        cheats.deal(address(3), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(4));
        cheats.deal(address(4), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(5));
        cheats.deal(address(5), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(6));
        cheats.deal(address(6), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(7));
        cheats.deal(address(7), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(8));
        cheats.deal(address(8), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(9));
        cheats.deal(address(9), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(10));
        cheats.deal(address(10), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(11));
        cheats.deal(address(11), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(12));
        cheats.deal(address(12), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(13));
        cheats.deal(address(13), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(14));
        cheats.deal(address(14), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(15));
        cheats.deal(address(15), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(16));
        cheats.deal(address(16), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(17));
        cheats.deal(address(17), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(18));
        cheats.deal(address(18), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
        cheats.prank(address(19));
        cheats.deal(address(19), 2 ether);
        sendViaCall(payable(miHolo), 1.5 ether);
    }



    // function testIncrement() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
