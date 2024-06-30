// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const initBalance = 0;
  const items = [
    { name: "Item 1", price: 1 },  // Price in ETH as integer
    { name: "Item 2", price: 2 },
    { name: "Item 3", price: 3 },
  ];

  const Assessment = await hre.ethers.getContractFactory("Assessment");
  const assessment = await Assessment.deploy(initBalance);
  await assessment.deployed();

  console.log(`A contract with balance of ${initBalance} ETH deployed to ${assessment.address}`);

  // Add items to the contract
  for (const item of items) {
    const tx = await assessment.addItem(item.name, ethers.utils.parseEther(item.price.toString()));
    await tx.wait();
    console.log(`Item "${item.name}" with price ${item.price} ETH added`);
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
