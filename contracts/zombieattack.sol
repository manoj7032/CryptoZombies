// SPDX-License-Identifier: MIT
pragma solidity ^0.4.25;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    uint randNonce = 0;
    uint attackVictoryProbability = 70;

    event NewZombie(uint zombieId, string name, uint dna);

    function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
    }

    function attack(uint _zombieId, uint _targetId) external onlyOwnerOf(_zombieId) {
        Zombie storage myZombie = zombies[_zombieId];
        Zombie storage enemyZombie = zombies[_targetId];

        uint rand = randMod(100);
        if (rand <= attackVictoryProbability) {
            myZombie.winCount++;
            myZombie.level++;
            enemyZombie.lossCount++;

            // Generate a new DNA and create a child zombie with the desired name format
            uint newDna = (myZombie.dna + enemyZombie.dna) / 2;
            string memory childName = string(abi.encodePacked("ChildZombie-", myZombie.name));
            
            // Call the function without assigning it directly to a variable
            _createZombie(childName, newDna);
        } else {
            myZombie.lossCount++;
            enemyZombie.winCount++;
            _triggerCooldown(myZombie);
        }
    }
}
