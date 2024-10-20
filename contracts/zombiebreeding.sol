// SPDX-License-Identifier: MIT
pragma solidity ^0.4.25;

import "./zombiefactory.sol";

contract ZombieBreeding is ZombieFactory {

    uint dnaModulus = 10 ** 16;

event BreedingInitiated(uint zombieId1, uint zombieId2);
event BreedingCompleted(uint newZombieId);

function breedZombies(uint _zombieId1, uint _zombieId2) external {
    emit BreedingInitiated(_zombieId1, _zombieId2);

    require(zombieToOwner[_zombieId1] == msg.sender, "Not owner of Zombie 1");
    require(zombieToOwner[_zombieId2] == msg.sender, "Not owner of Zombie 2");
    require(_zombieId1 != _zombieId2, "Cannot breed the same zombie.");

    uint newDna = (zombies[_zombieId1].dna + zombies[_zombieId2].dna) / 2;
    _createZombie("BabyZombie", newDna);

    emit BreedingCompleted(zombies.length - 1);
}


}
