const StepUpToken = artifacts.require("StepUpToken");
const StepUpTokenSale = artifacts.require("StepUpTokenSale");

module.exports = async function (deployer, network, accounts) {
  let tokenContract = await StepUpToken.deployed();
  await deployer.deploy(StepUpTokenSale, accounts[0], tokenContract.address);
};
