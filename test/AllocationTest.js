let chai = require("chai")
let chaiAsPromised = require("chai-as-promised")
chai.use(chaiAsPromised)
chai.should()

let VegaToken = artifacts.require("VegaToken");
let VegaCampaign = artifacts.require("VegaCampaign");
let MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
let MiniMeToken = artifacts.require("MiniMeToken");
let StandardVote = artifacts.require("StandardVote")
let Allocation = artifacts.require("Allocation")
let Vault = artifacts.require("Vault")

const verbose = false;

contract("Allocation", (accounts) => {

    let factory;
    let vegaCampaign;
    let vega, vote, quorum;
    let now = web3.eth.getBlock(web3.eth.blockNumber).timestamp;
    const TIME_INCREMENT = 10000;
    const TRANSFER_ONE = 10000;
    const TRANSFER_TWO = 12345;
    const CAMPAIGN_CAP = 1000000;
    let senderOne = accounts[0]
    let senderTwo = accounts[1]
    let valueOne, valueTwo, senderOneVoteIndex, senderOneVoteInfo, voteResult, allocationValue
    
    let campaignDeployParams = 
    (vault, token) => 
    [
        now,
        now + TIME_INCREMENT,
        vault,
        token
    ]

    let vaultDeployParams = 
    (caller, destination, minLockTime, timeLock, guard, guardDelay) => 
    [
        caller,
        destination,
        minLockTime,
        timeLock,
        guard,
        guardDelay
    ]

    before(async() => {

        vault = await Vault.new.apply(
            this,
            vaultDeployParams(
                accounts[0],
                accounts[1],
                0,
                0,
                accounts[1],
                0
                )
        )

        vault2 = await Vault.new.apply(
            this,
            vaultDeployParams(
                accounts[0],
                accounts[1],
                0,
                0,
                accounts[1],
                0
                )
        )
        factory = await MiniMeTokenFactory.new.apply(
            this  
        )
        vega = await VegaToken.new.apply(
            this,
            [factory.address]
        )

        vega2 = await VegaToken.new.apply(
            this,
            [factory.address]
        )

        vegaCampaign = await VegaCampaign.new.apply(
            this,
            campaignDeployParams(vault.address, vega.address)
        )

        vegaCampaign2 = await VegaCampaign.new.apply(
            this,
            campaignDeployParams(vault2.address, vega2.address)
        )

        vega.changeController(vegaCampaign.address)
        vega2.changeController(vegaCampaign2.address)    

        vote = await StandardVote.new.apply(
            this,
        [
            vega.address
        ]
        )
        allocation = await Allocation.new(
            TIME_INCREMENT,
            accounts[4],
            vega2.address,
            TRANSFER_ONE,
            vote.address
        )
    });

    it("should let sender one donate to the vega campaign", async () => {
       
        // Use balanceOfAt as current MiniMeToken does not support balance()        
        await vegaCampaign.sendTransaction({from: senderOne, value: TRANSFER_ONE})
        valueOne = await vega.balanceOfAt(senderOne, web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        valueOne.toNumber().should.be.equal(TRANSFER_ONE)
    })

    it("should let sender one donate to the vega campaign2", async () => {
       
        // Use balanceOfAt as current MiniMeToken does not support balance()        
        await vegaCampaign2.sendTransaction({from: senderOne, value: (TRANSFER_ONE)})
        valueOne = await vega2.balanceOfAt(senderOne, web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        valueOne.toNumber().should.be.equal(TRANSFER_ONE)
    })

    it("should let sender two donate to the vega campaign", async () => {    
        // Transfer tokens to second account
        await vegaCampaign.sendTransaction({from: senderTwo, value: TRANSFER_TWO})
        valueTwo = await vega.balanceOfAt(senderTwo, web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        valueTwo.toNumber().should.be.equal(TRANSFER_TWO)
    })
    it("should let sender one vote on the proposal", async () => {        
        await vote.vote(true, {from: senderOne})
        await vote.countVote()

        await vega2.transfer(vega.address, TRANSFER_ONE, {from: senderOne} )

        senderOneVoteIndex = await vote.statusMap(senderOne)
        senderOneVoteInfo = await vote.votes(senderOneVoteIndex[1].toNumber())
        senderOneVoteInfo[2].toNumber().should.be.equal(valueOne.toNumber())
    })
    it("vote should pass", async () => {    
        voteResult = await vote.isVotePassed()
        voteResult.should.be.true
    })
    it("proposal should execute", async () => {    
        await vega.executeFinancialProposal(allocation.address)        
        allocationValue = await vega2.balanceOfAt(accounts[4], web3.eth.getBlock(web3.eth.blockNumber).timestamp)
        allocationValue.toNumber().should.be.equal(TRANSFER_ONE)
    })
});