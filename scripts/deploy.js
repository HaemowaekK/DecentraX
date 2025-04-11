require("dotenv").config();
const hre = require("hardhat");

async function main() {
  console.log(" Deploying Smart Contract...");

  // Get the contract factory
  const SecureFileTransfer = await hre.ethers.getContractFactory("SecureFileTransfer");

  // Deploy the contract
  const contract = await SecureFileTransfer.deploy();
  await contract.waitForDeployment();  

  console.log(` Contract deployed at: ${await contract.getAddress()}`);
}

main().catch((error) => {
  console.error(" Deployment failed:", error);
  process.exitCode = 1;
});
