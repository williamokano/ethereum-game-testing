const GameToken = artifacts.require("GameToken");

module.exports = function (deployer) {
  deployer.deploy(GameToken, "Shit", "SHIT", 18);
};
