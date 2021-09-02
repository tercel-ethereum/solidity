pragma solidity >=0.9.0;

contract TestExtOpenAPI {
    address public b;

    function test() public returns (address){
        b=address(this);
        // extopenapi("abc","{}","json");
        return b;
    }
    
    function toEthBytes32SignedMessageHash (bytes32 _msg) public pure returns (bytes32 signHash) {
        signHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _msg));
    }
    
    function recoverAddresses(bytes32 _hash, bytes memory _signatures)  public pure returns (address[] memory addresses) {
        uint8 v;
        bytes32 r;
        bytes32 s;
        uint count = _countSignatures(_signatures);
        addresses = new address[](count);
        for (uint i = 0; i < count; i++) {
            (v, r, s) = _parseSignature(_signatures, i);
            addresses[i] = ecrecover(_hash, v, r, s);
        }
    }
    
    function _parseSignature(bytes memory _signatures, uint _pos) pure internal returns (uint8 v, bytes32 r, bytes32 s) {
        uint offset = _pos * 65;
        assembly {
            r := mload(add(_signatures, add(32, offset)))
            s := mload(add(_signatures, add(64, offset)))
            v := and(mload(add(_signatures, add(65, offset))), 0xff)
        }

        if (v < 27) v += 27;

        require(v == 27 || v == 28);
    }
    
    function _countSignatures(bytes memory _signatures) pure internal returns (uint) {
        return _signatures.length % 65 == 0 ? _signatures.length / 65 : 0;
    }
    
}