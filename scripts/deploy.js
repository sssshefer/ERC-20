const hre = require('hardhat')
const ethers = hre.ethers

async function main() {
  const [signer] = await ethers.getSigners()

  const Erc = await ethers.getContractFactory('ShefShop', signer)
  const erc = await Erc.deploy()
  await erc.waitForDeployment()
  console.log(erc.target)
  console.log(await erc.token())
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });