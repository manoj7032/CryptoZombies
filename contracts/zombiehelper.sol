pragma solidity ^0.4.25;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  uint levelUpFee = 0.001 ether;
  mapping(bytes32 => bool) public existingNames;

function _stringToBytes32(string memory source) internal pure returns (bytes32 result) {
    bytes memory temp = bytes(source);
    if (temp.length == 0) {
        return 0x0;
    }
    assembly {
        result := mload(add(source, 32))
    }
}

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }


  function withdraw() external onlyOwner {
    address _owner = owner();
    _owner.transfer(address(this).balance);
  }

  function setLevelUpFee(uint _fee) external onlyOwner {
    levelUpFee = _fee;
  }

  function levelUp(uint _zombieId) external payable {
    require(msg.value == levelUpFee);
    zombies[_zombieId].level = zombies[_zombieId].level.add(1);
  }
  function levelDown(uint _zombieId) external onlyOwnerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    require(myZombie.level > 1, "Zombie level cannot be less than 1");
    myZombie.level = myZombie.level.sub(1);
    }

function changeName(uint _zombieId, string _newName) external onlyOwnerOf(_zombieId) {
        bytes32 newNameHash = keccak256(abi.encodePacked(_newName)); // Convert to bytes32
        require(!existingNames[newNameHash], "This name is already taken.");

        bytes32 oldNameHash = keccak256(abi.encodePacked(zombies[_zombieId].name));
        existingNames[oldNameHash] = false;  // Remove old name from tracking

        zombies[_zombieId].name = _newName;
        existingNames[newNameHash] = true;  // Track the new name
    }




  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) onlyOwnerOf(_zombieId) {
    zombies[_zombieId].dna = _newDna;
  }

  function getZombiesByOwner(address _owner) external view returns(uint[]) {
    uint[] memory result = new uint[](ownerZombieCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < zombies.length; i++) {
      if (zombieToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}
