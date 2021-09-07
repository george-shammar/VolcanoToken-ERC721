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
    
    function mintToken(address to, uint256 tokenId) public {
        _mint(to, tokenId);
         tokenOwnership[to].push(TokenMetaData(tokenId, block.timestamp, "http://newToken1"));
         tokenId += 1;
    }

    function burnToken(uint256 tokenId) public {
        require(msg.sender == ownerOf(tokenId), "You do not own this token. You're unauthorized");
        _burn(tokenId);
        removeToken(tokenId);
    }

    function removeToken(uint256 _tokenId) private {
        for(uint256 i=0; i<tokenOwnership[msg.sender].length; i++){
            if(tokenOwnership[msg.sender][i].tokenId==_tokenId){
                delete tokenOwnership[msg.sender][i];
            }
        }
    }
}