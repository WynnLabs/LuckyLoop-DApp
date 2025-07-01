const hre = require("hardhat");

async function main() {
  const LuckyLoop = await hre.ethers.getContractFactory("LuckyLoop");
  const luckyLoop = await LuckyLoop.deploy();
  await luckyLoop.deployed();
  console.log("LuckyLoop deployed to:", luckyLoop.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});