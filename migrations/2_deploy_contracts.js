//var MiniMetaCoin = artifacts.require("../contracts/MiniMetaCoin.sol");
var VegaToken = artifacts.require("./tokens/VegaToken.sol");
let MiniMeToken = artifacts.require("MiniMeToken");
let MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");

module.exports = function(deployer) {
    deployer.deploy(MiniMeToken);
    deployer.deploy(VegaToken);
};
