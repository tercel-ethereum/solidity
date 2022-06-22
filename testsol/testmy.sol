// SPDX-License-Identifier: MIT

pragma solidity >=0.9.0;


contract TestMy {
    event WriteApi(address indexed user, bytes data);
    uint public result=1;
    function trevert() external pure {
        revert('test revert');
    }

    function getRandom() external view returns (uint256) {
        return block.random;
    }
    
    function callmyopcode() external view returns (uint256) {
        return myopcode("dog");
    }
    
    function callapi() external view returns (uint256, uint256) {
        return extopenapi("http://localhost:3000/demo");
    }

    function callsapi() external view returns (uint256, uint256, bytes memory) {
        return extsopenapi("http://localhost:3000/demos");
    }

    function callsapi2() external view returns (uint256, uint256, bytes memory) {
        extsopenapi("http://localhost:3000/demos");
    }
    
    function writemyopcode() external returns (uint256) {
        emit WriteApi(msg.sender, "writeapi result");
        result = myopcode("dog");
        return result;
    }

    function testsha3r() external view returns (bytes32) {
        return keccak256("abc");
    }
}
