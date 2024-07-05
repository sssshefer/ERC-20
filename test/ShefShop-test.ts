import { loadFixture, ethers, expect } from "./setup";
import tokenJson from "../artifacts/contracts/ERC-20.sol/ShefToken.json"

describe("AuctionEngine", function () {
    async function deploy() {
        //deploy by default is done with user1 account funds
        const [owner, buyer] = await ethers.getSigners();

        const Factory = await ethers.getContractFactory("ShefShop", owner);
        const shefShop = await Factory.deploy();
        await shefShop.waitForDeployment()
        const erc20:any = new ethers.Contract(await shefShop.token(), tokenJson.abi, owner)
        return { owner, buyer, shefShop, erc20 }
    }

    it("Have an owner and a token", async function () {
        const { owner,buyer, shefShop } = await loadFixture(deploy);
        expect(await shefShop.owner()).to.eq(owner.address);
        expect (await shefShop.token()).to.be.properAddress;       
    })

    
    
});