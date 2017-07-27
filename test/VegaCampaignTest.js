const ethConnector = require("ethconnector");
const assert = require("assert"); // node.js core module
const async = require("async");

var VegaCampaignFactory = artifacts.require("VegaCampaignFactory");
var MiniMeToken = artifacts.require("../node_modules/minimetoken/contracts/MiniMeToken.sol");
const verbose = false;

contract('VegaCampaignFactory', function(accounts) {
  /*
  it("should put 10000 MetaCoin in the first account", () => {
    return MiniMeToken.new(accounts[7], 0x0, 0x0, "Vega", 18, "Vega", false).then(function(instance) {
      instance.totalSupply.call().then( (result) => {
        console.log("Supply:" + result);
      })
      return VegaCampaignFactory.new((new Date().getTime() / 1000) , (new Date().getTime() / 1000)  + (24 * 60 *60 * 5), 1000, accounts[0] , instance.address ).then(function(instance) {
        console.log(instance.address);
        console.log("balance: " + web3.eth.getBalance(instance.address));      
        console.log("balance: " + web3.eth.getBalance(accounts[8]));      
        web3.eth.sendTransaction({ from: accounts[8], to: instance.address, value: 100 })
        //instance.finalizeFunding();
        let mini = MiniMeToken.at(accounts[7]);
        return mini.balanceOf(accounts[8]);
      })
    });  
  });
  */
});

