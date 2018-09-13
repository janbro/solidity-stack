pragma solidity ^0.4.23;

contract Ownable {
    event NewOwner(address oldOwner, address newOwner);

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function owner() public view returns(address) {
        return owner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit NewOwner(owner, newOwner);
        owner = newOwner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

}
