let chai = require("chai")
let chaiAsPromised = require("chai-as-promised")
chai.use(chaiAsPromised)
chai.should()

let VegaToken = artifacts.require("VegaToken");
let VegaCampaign = artifacts.require("VegaCampaign");
let MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
let MiniMeToken = artifacts.require("MiniMeToken");
let StandardVote = artifacts.require("StandardVote");
let Quorum = artifacts.require("Quorum");


const verbose = false;

contract("Standard Vote", (accounts) => {

    let factory;
    let vegaCampaign;
    let vega, vote, quorum;
    let now = web3.eth.getBlock(web3.eth.blockNumber).timestamp;
    const TIME_INCREMENT = 10000;
    const TRANSFER_ONE = 10000;
    const TRANSFER_TWO = 12345;
    const CAMPAIGN_CAP = 1000000;


    let campaignDeployParams = 
    (vault, token) => 
    [
        now,
        now + TIME_INCREMENT,
        CAMPAIGN_CAP,
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

      quorum = await Quorum.new.apply(
        this,
        [
          60,
          vega.address,
          "TEST",
          "This is a test",
          TIME_INCREMENT
        ]
      )

      vote = await StandardVote.new.apply(
        this,
        [
          quorum.address,
          vega.address
        ]
      )
    });

    it("should send funds to the vegaCampaign", async () => {
        let senderOne = accounts[0]
        let senderTwo = accounts[1]        
        // Use balanceOfAt as current MiniMeToken does not support balance()        
        await vegaCampaign.sendTransaction({from: senderOne, value: TRANSFER_ONE})
        let valueOne = await vega.balanceOfAt(senderOne, web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        valueOne.toNumber().should.be.equal(TRANSFER_ONE)
        // Transfer tokens to second account
        await vegaCampaign.sendTransaction({from: senderTwo, value: TRANSFER_TWO})
        let valueTwo = await vega.balanceOfAt(senderTwo, web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        valueTwo.toNumber().should.be.equal(TRANSFER_TWO)

        await vote.vote(true, {from: senderOne})
    })
});