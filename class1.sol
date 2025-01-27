//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;
contract payableC
{
    address payable public owner;
    constructor()
    {
        owner = payable (msg.sender);
    }

    function deposit () public payable
    {

    }


    function checkBalance () public view returns (uint)
    {
        uint _amount = address(this).balance;
        return (_amount);
    }

    function withdraw () public
    {
        uint _amount = address(this).balance;
           (bool success, ) =owner.call{value:_amount}("");
    require (success, "failed to send ether");
    }

    function transfer(address _to, uint _amount) public
    {
        (bool success, )=_to.call{value:_amount}("");
        require(success, "failed to transfer ether");
    }

}