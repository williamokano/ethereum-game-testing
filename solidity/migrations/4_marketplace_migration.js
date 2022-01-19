const NewToken = artifacts.require("NewToken");
const Marketplace = artifacts.require("Marketplace");

module.exports = function (deployer) {
  deployer.deploy(Marketplace, NewToken.address);
};
