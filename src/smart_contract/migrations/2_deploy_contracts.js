const GovernmentProcurement = artifacts.require("GovernmentProcurement");
const MyToken = artifacts.require("MyToken");
const DocumentRegistry = artifacts.require("DocumentRegistry");

module.exports = async function (deployer) {
  await deployer.deploy(MyToken, 1000000);
  const tokenInstance = await MyToken.deployed();
  const paymentTokenAddress = tokenInstance.address;
  await deployer.deploy(DocumentRegistry);
  await deployer.deploy(GovernmentProcurement, paymentTokenAddress);
};
