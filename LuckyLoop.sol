// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyLoop {
    address public treasury;
    uint256 public currentRound;
    mapping(address => bool) public hasEntered;

    constructor() {
        treasury = 0x7F3a1c03D9B3a4B3F3A4B3F3A4B3F3A4B3F3A4B;
        currentRound = 1;
    }

    function enterLottery() public payable {
        require(msg.value == 0.1 ether, "Entry fee is 0.1 ETH");
        require(!hasEntered[msg.sender], "Already entered this round");
        hasEntered[msg.sender] = true;
        (bool sent, ) = treasury.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function currentRound() public view returns (uint256) {
        return currentRound;
    }
}