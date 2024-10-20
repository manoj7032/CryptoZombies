// SPDX-License-Identifier: MIT
pragma solidity ^0.4.25;

import "./safemath.sol";
import "./erc721.sol";
import "./ownable.sol";  // Ensure you have the correct Ownable contract imported

contract KittyOwnership is ERC721, Ownable {
    using SafeMath for uint256;

    struct Kitty {
        string name;
        uint256 dna;
    }

    Kitty[] public kitties;

    mapping(uint256 => address) public kittyToOwner;
    mapping(address => uint256) ownerKittyCount;
    mapping(uint256 => address) kittyApprovals;

    event NewKitty(uint256 kittyId, string name, uint256 dna);

    // Create a new kitty 
    function createRandomKitty(string memory _name, uint256 _dna) public {
    _createKitty(_name, _dna);
}

    function _createKitty(string _name, uint256 _dna) internal {
        uint256 id = kitties.push(Kitty(_name, _dna)) - 1;
        kittyToOwner[id] = msg.sender;
        ownerKittyCount[msg.sender] = ownerKittyCount[msg.sender].add(1);
        emit NewKitty(id, _name, _dna);
    }

    function balanceOf(address owner) external view returns (uint256) {
        return ownerKittyCount[owner];
    }

    function ownerOf(uint256 tokenId) external view returns (address) {
        return kittyToOwner[tokenId];
    }

    function approve(address to, uint256 tokenId) external payable {
        require(kittyToOwner[tokenId] == msg.sender, "Not the owner.");
        kittyApprovals[tokenId] = to;
        emit Approval(msg.sender, to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) external payable {
        require(
            kittyApprovals[tokenId] == msg.sender || kittyToOwner[tokenId] == msg.sender,
            "Not approved or owner."
        );
        kittyToOwner[tokenId] = to;
        ownerKittyCount[from] = ownerKittyCount[from].sub(1);
        ownerKittyCount[to] = ownerKittyCount[to].add(1);
        emit Transfer(from, to, tokenId);
    }

    function getKittiesByOwner(address owner) external view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](ownerKittyCount[owner]);
        uint256 counter = 0;
        for (uint256 i = 0; i < kitties.length; i++) {
            if (kittyToOwner[i] == owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}
