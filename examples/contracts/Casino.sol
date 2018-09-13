pragma solidity ^0.4.23;

import './Ownable.sol';

contract Casino {

    uint256 minBet;
    uint256 number = 142;

    constructor(uint256 _minBet) public {
        require(msg.value == 1 ether);
        minBet = _minBet;
    }

    function GuessTheNumber(uint256 guess) public payable {
        require(msg.value == 0.1 ether);

        if (guess == number) {
            msg.sender.transfer(0.2 ether);
        }
    }

    function GuessTheRandomNumber(uint8 guess) public payable {
        require(msg.value == 0.1 ether);

        uint8 answer = uint8(keccak256(blockhash(block.number - 1), now));

        if (guess == answer) {
            msg.sender.transfer(0.2 ether);
        }
    }
    
}