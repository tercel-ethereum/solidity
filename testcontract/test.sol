pragma solidity >=0.9.0;

contract Test {
    address public b;

    function test() public returns (address){
        b=address(this);
        return b;
    }
}