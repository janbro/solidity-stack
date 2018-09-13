pragma solidity ^0.4.23;

contract Coin {
    address minter;
    mapping (address => uint) balances;

    constructor() public {
        minter = msg.sender;
    }

    function mint(address owner, uint amount) public {
        if (msg.sender != minter) return;
        balances[owner] += amount;
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }

    function queryBalance(address addr) public constant returns (uint balance) {
        return balances[addr];
    }
}