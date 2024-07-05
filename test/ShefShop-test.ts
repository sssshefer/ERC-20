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
    
    it("allows to buy", async function() {
        const { owner,buyer, shefShop, erc20 } = await loadFixture(deploy);
        const tokenAmount = 3;
        const txData = {
            value:tokenAmount,
            to:shefShop
        }

        const tx = await buyer.sendTransaction(txData);
        await tx.wait();

        expect(await erc20.balanceOf(buyer.address)).to.eq(tokenAmount);

        await expect(()=> tx).to.changeEtherBalance(shefShop, tokenAmount);

        await expect(tx).to.emit(shefShop, "Bought")
        .withArgs(tokenAmount, buyer.address)
    })

    it("allows to sell", async function() {
        const { owner,buyer, shefShop, erc20 } = await loadFixture(deploy);

        const tokensToBuy = 3;
        const tx = await buyer.sendTransaction({
            value:tokensToBuy,
            to:shefShop
        })

        await tx.wait()

        const sellAmount = 2;
        
        const approval = await erc20.connect(buyer).approve(shefShop, sellAmount);

        await approval.wait();

        const sellTx =  await shefShop.connect(buyer).sell(sellAmount);
        
        expect(await erc20.balanceOf(buyer.address)).to.eq(1);

        await expect(()=> sellTx).to.changeEtherBalance(shefShop, -sellAmount);

        await expect(sellTx).to.emit(shefShop, "Sold")
        .withArgs(sellAmount, buyer.address)

    })   
});