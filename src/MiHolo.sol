// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MiHolo {
    uint256 public sold;
    address owner = 0xA9e095A27CF64DFD0a8a8C3ecAA9C92039c7d2E6;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier haltSales(){
        require(sold < 180, "Sold Out");
        _;
    }

    modifier saleValidation(){
        require(msg.value == 1.5 ether || msg.value == 0.5 ether || msg.value == 0.18 ether, "Invalid Amount Sent");
        _;
    }

    fallback() external haltSales saleValidation payable {
        if (msg.value == 1.5 ether){
            sold += 10;
        } else if(msg.value == 0.5 ether){
            sold += 3;
        } else if(msg.value == 0.18 ether){
            sold++;
        }
    }

    function transferETH(address payable _to, uint256 _amount) onlyOwner public payable{
        (bool sent, bytes memory data) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }

}
