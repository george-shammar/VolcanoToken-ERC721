// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoToken is ERC721, Ownable {
     
    uint256 tokenId = 0;
    
    struct TokenMetaData {
        uint256 tokenId;
        uint timestamp;
        string tokenURI;
    }
    
    mapping(address => TokenMetaData[]) public tokenOwnership;
    
    constructor() ERC721("VolcanoToken", "VKT") {
        
    }
    
}