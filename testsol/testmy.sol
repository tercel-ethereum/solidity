// SPDX-License-Identifier: MIT

pragma solidity >=0.9.0;


contract TestMy {
    event WriteApi(address indexed user, bytes data);

    function getRandom() external view returns (uint256) {
        return block.random;
    }
    
    function callapi() external view returns (bytes memory) {
        return extopenapi("url://", "parameters:", "string");
    }
    
    function writeapi() external returns (bytes memory) {
        emit WriteApi(msg.sender, "writeapi result");
        return extopenapi("url://", "parameters:", "string");
    }

    function testsha3r() external view returns (bytes32) {
        return keccak256("abc");
    }
}
