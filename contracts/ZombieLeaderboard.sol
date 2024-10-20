// SPDX-License-Identifier: MIT
pragma solidity ^0.4.25;

pragma experimental ABIEncoderV2;

import "./zombiehelper.sol";

contract ZombieLeaderboard is ZombieHelper {
    struct Leader {
        string name;
        uint winCount;
    }

    Leader[] public leaderboard;

    event LeaderboardUpdated(string name, uint winCount);

    function updateLeaderboard(uint _zombieId) internal {
    string memory zombieName = zombies[_zombieId].name;
    uint zombieWins = zombies[_zombieId].winCount;

    bool exists = false;
    for (uint i = 0; i < leaderboard.length; i++) {
        if (keccak256(abi.encodePacked(leaderboard[i].name)) == keccak256(abi.encodePacked(zombieName))) {
            leaderboard[i].winCount = zombieWins;
            exists = true;
            break;
        }
    }
    if (!exists) {
        leaderboard.push(Leader(zombieName, zombieWins));
    }

    emit LeaderboardUpdated(zombieName, zombieWins);
}
}
