var VegaCampaignFactory = artifacts.require("VegaCampaignFactory");
var MiniMeToken = artifacts.require("../node_modules/minimetoken/contracts/MiniMeToken.sol");
contract('VegaCampaignFactory', function(accounts) {
  it("should put 10000 MetaCoin in the first account", function() {
    return VegaCampaignFactory.deployed().then(function(instance) {
      console.log(instance.address);
      console.log("balance: " + web3.eth.getBalance(instance.address));      
      console.log("balance: " + web3.eth.getBalance(accounts[8]));      
      web3.eth.sendTransaction({ from: accounts[8], to: instance.address, value: 100 })
      //return MiniMeToken.at("0x3d68221571b94075b34396ab49ff0bc2217c65ec6129dbabd281485c306c3871").balanceOfAt(accounts[8], web3.eth.getBlock("latest"))
    }).then(function(balance) {
    });
  });
  /*it("should send coin correctly", function() {
    var meta; 

    // Get initial balances of first and second account.
    var account_one = accounts[0];
    var account_two = accounts[1];

    var account_one_starting_balance;
    var account_two_starting_balance;
    var account_one_ending_balance;
    var account_two_ending_balance;

    var amount = 10;

    return VegaCampaignFactory.deployed().then(function(instance) {
      meta = instance;
      return meta.getBalance.call(account_one);
    }).then(function(balance) {
      account_one_starting_balance = balance.toNumber();
      return meta.getBalance.call(account_two);
    }).then(function(balance) {
      account_two_starting_balance = balance.toNumber();
      return meta.sendCoin(account_two, amount, {from: account_one});
    }).then(function() {
      return meta.getBalance.call(account_one);
    }).then(function(balance) {
      account_one_ending_balance = balance.toNumber();
      return meta.getBalance.call(account_two);
    }).then(function(balance) {
      account_two_ending_balance = balance.toNumber();

      assert.equal(account_one_ending_balance, account_one_starting_balance - amount, "Amount wasn't correctly taken from the sender");
      assert.equal(account_two_ending_balance, account_two_starting_balance + amount, "Amount wasn't correctly sent to the receiver");
    });
  });*/
});