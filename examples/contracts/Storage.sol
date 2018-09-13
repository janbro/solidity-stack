pragma solidity ^0.4.23;
import './Ownable.sol';

contract Storage is Ownable {
    event ValueSet(uint256);

    uint256 value;
    
    function set (uint256 _value) public {
        value = _value;
        emit ValueSet(value);
    }

    function get () public view returns(uint256) {
        return value;
    }

}
