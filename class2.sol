// SPDX-License-Identifier:Unlicense
pragma solidity ^0.8.0;

contract EtherSender {
    address public owner;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to only allow the owner to call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    // Function to allow anyone to send Ether to the contract
    receive() external payable {
    }

    // Function to send Ether from the contract to a specified address
    function sendEther(address payable _to, uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance in the contract");
        _to.transfer(_amount);
    }

    // Function to retrieve the contract's balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
