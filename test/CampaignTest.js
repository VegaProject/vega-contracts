let chai = require("chai")
let chaiAsPromised = require("chai-as-promised")
chai.use(chaiAsPromised)
chai.should()

let VegaToken = artifacts.require("VegaToken");
let VegaCampaign = artifacts.require("VegaCampaign");
let MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
let MiniMeToken = artifacts.require("MiniMeToken");


const verbose = false;

contract("Vega", (accounts) => {


    let factory;
    let vegaCampaign;
    let vega;

    const TRANSFER_ONE = 10000;

    let campaignDeployParams = 
    (vault, token) => 
    [
        0,
        1531180800,
        1000000,
        vault,
        token
    ]

    before(async() => {
      factory = await MiniMeTokenFactory.new.apply(
        this  
      )
      vega = await VegaToken.new.apply(
        this,
        [factory.address]
      )
      vegaCampaign = await VegaCampaign.new.apply(
        this,
        campaignDeployParams(accounts[0], vega.address)
      )
      vega.changeController(vegaCampaign.address)
    });

    it("should send funds to the vegaCampaign", async () => {
        let sender = accounts[0]
        await vegaCampaign.send(TRANSFER_ONE,{from: sender})
        // Use balanceOfAt as current MiniMeToken does not support balance()
        let value = await vega.balanceOfAt(sender, web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        console.log(value)
        value.toNumber().should.be.equal(10000)        
    })
});