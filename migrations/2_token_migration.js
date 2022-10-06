const StepUpToken = artifacts.require("StepUpToken");

module.exports = async function (deployer,network,accounts) {
  await deployer.deploy(StepUpToken, 1000000,{ from: accounts[0]});
};
