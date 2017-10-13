let chai = require("chai")
let chaiAsPromised = require("chai-as-promised")
chai.use(chaiAsPromised)
chai.should()

let CDRCalculator = artifacts.require("CDRCalculator");

const verbose = false;

contract("Standard Vote", (accounts) => {

    const CURRENT_VALUE_ONE = 7000000
    const CURRENT_VALUE_TWO = 3000000
    const STARTING_VALUE = 5000000
    const VEGA_PERIOD = 1
    const STAKE_ONE = 100000
    const STAKE_TWO = -100000
    const TOTAL_REWARDS = 1000000
    const TOKEN_CONVERSION = 100000
    before(async() => {
      cdr = await CDRCalculator.new.apply(
        this  
      )
    })

    it("should calculate the rod", async () => {
        let rod = await (cdr.returnOnDecision.call(CURRENT_VALUE_ONE, STARTING_VALUE))
        console.log("ROD:" + rod)
    })


    it("should calculate the cvpgr", async () => {
        let rod = await (cdr.returnOnDecision.call(CURRENT_VALUE_ONE, STARTING_VALUE))
        let cvpgr = await cdr.returnCVPGR.call(rod, VEGA_PERIOD)
        console.log("CVPGR:" + cvpgr)        
        let reward = await cdr.reward.call(STAKE_ONE, cvpgr)
        let tokens_rewards = await cdr.tokens(reward, TOTAL_REWARDS, TOKEN_CONVERSION)
    })


    it("should calculate the reward", async () => {
        let rod = await (cdr.returnOnDecision.call(CURRENT_VALUE_ONE, STARTING_VALUE))
        let cvpgr = await cdr.returnCVPGR.call(rod, VEGA_PERIOD)
        let reward = await cdr.reward.call(STAKE_ONE, cvpgr)
        console.log("CVPGR:" + cvpgr)        
        let tokens_rewards = await cdr.tokens(reward, TOTAL_REWARDS, TOKEN_CONVERSION)
    })


    it("should calculate the tokens rewards", async () => {
        let rod = await (cdr.returnOnDecision.call(CURRENT_VALUE_ONE, STARTING_VALUE))
        let cvpgr = await cdr.returnCVPGR.call(rod, VEGA_PERIOD)
        let reward = await cdr.reward.call(STAKE_ONE, cvpgr)
        let tokenAdjustment = await cdr.tokens(reward, TOTAL_REWARDS, TOKEN_CONVERSION)
        console.log("Token adjustment:" + tokenAdjustment)                
    })
});
