const NewToken = artifacts.require("NewToken");
const Marketplace = artifacts.require("Marketplace");

module.exports = async function (deployer) {
  const token = await NewToken.deployed()

  const PUMP_TALISMAN = await token.PUMP_TALISMAN()
  const SUPERBOOTS = await token.SUPERBOOTS()
  const TIMEWARP_CAPE = await token.TIMEWARP_CAPE()

  await token.mint(Marketplace.address, PUMP_TALISMAN, 30, "0x0")
  await token.mint(Marketplace.address, SUPERBOOTS, 20, "0x0")
  await token.mint(Marketplace.address, TIMEWARP_CAPE, 10, "0x0")
};
