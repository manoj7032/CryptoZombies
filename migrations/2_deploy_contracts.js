var safemath = artifacts.require("./safemath.sol");
var zombiefactory = artifacts.require("./zombiefactory.sol");
var zombiefeeding = artifacts.require("./zombiefeeding.sol");
var zombiehelper = artifacts.require("./zombiehelper.sol");
var zombieattack = artifacts.require("./zombieattack.sol");
var zombieownership = artifacts.require("./zombieownership.sol");
const ZombieBreeding = artifacts.require("ZombieBreeding.sol");
const ZombieAttack = artifacts.require("ZombieAttack");
const ZombieLeaderboard = artifacts.require("ZombieLeaderboard");
var kittyownership = artifacts.require("./kittyownership.sol")

module.exports = function(deployer) {

    deployer.deploy(safemath);
    deployer.deploy(zombiefactory);
    deployer.deploy(zombiefeeding);
    deployer.deploy(zombiehelper);
    deployer.deploy(zombieattack);
    deployer.deploy(zombieownership);
    deployer.deploy(ZombieBreeding);
    deployer.deploy(ZombieAttack);
    deployer.deploy(ZombieLeaderboard);
    deployer.deploy(kittyownership);

}