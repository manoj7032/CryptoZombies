pragma solidity ^0.4.25;

import "./ownable.sol";
import "./safemath.sol";

contract ZombieFactory is Ownable {

  using SafeMath for uint256;
  using SafeMath32 for uint32;
  using SafeMath16 for uint16;

  event NewZombie(uint zombieId, string name, uint dna);

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;
  uint cooldownTime = 1 minutes;

  struct Zombie {
    string name;
    uint dna;
    uint32 level;
    uint32 readyTime;
    uint16 winCount;
    uint16 lossCount;
  }



  Zombie[] public zombies;

  mapping (uint => address) public zombieToOwner;
  mapping (address => uint) ownerZombieCount;
  mapping(bytes32 => bool) public existingZombieNames;


    // Create a new zombie with unique name
  function _createZombie(string _name, uint _dna) internal {
      bytes32 nameHash = keccak256(abi.encodePacked(_name));  // Hash the name to bytes32
      require(!existingZombieNames[nameHash], "This name is already taken.");  // Check for duplicate names

      uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + 1 days), 0, 0)) - 1;
      zombieToOwner[id] = msg.sender;
      ownerZombieCount[msg.sender]++;
      existingZombieNames[nameHash] = true;  // Mark name as used

      emit NewZombie(id, _name, _dna);
  }

  // Generate random DNA
  function _generateRandomDna(string _str) private view returns (uint) {
      uint rand = uint(keccak256(abi.encodePacked(_str)));
      return rand % dnaModulus;
  }

  // Public function to create a zombie
  function createRandomZombie(string _name) public {
      bytes32 nameHash = keccak256(abi.encodePacked(_name));  // Hash the name to bytes32
      require(!existingZombieNames[nameHash], "This name is already taken.");  // Check for duplicate names

      uint dna = _generateRandomDna(_name);
      _createZombie(_name, dna);
  }


}