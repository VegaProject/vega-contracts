let chai = require("chai")
let chaiAsPromised = require("chai-as-promised")
chai.use(chaiAsPromised)
chai.should()

let CDRCalculator = artifacts.require("CDRCalculator");

const verbose = false;

contract("ROD Calculator", (accounts) => {

    const CURRENT_VALUE_ONE = 200
    const STARTING_VALUE = 100
    const VEGA_PERIOD = 2
    const STAKE_ONE = 1000000
    const TOTAL_REWARDS = 250000000
    const TOKEN_CONVERSION = 50000000
    const BALANCE = 1000000

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

    it("should update the balance", async () => {
      let newBalance = await cdr.updateBalance(BALANCE, CURRENT_VALUE_ONE, STARTING_VALUE, STAKE_ONE, VEGA_PERIOD, TOTAL_REWARDS, TOKEN_CONVERSION)
      console.log("New balanceL" + newBalance)
    })
});
