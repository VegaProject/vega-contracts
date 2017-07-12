var ConvertLib = artifacts.require("../contracts/ConvertLib.sol");
var MiniMetaCoin = artifacts.require("../contracts/MiniMetaCoin.sol");
var VegaCampaignFactory = artifacts.require("../contracts/VegaCampaignFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MiniMetaCoin);
  deployer.deploy(MiniMetaCoin);
  deployer.deploy(VegaCampaignFactory, (new Date().getTime() / 1000), (new Date().getTime() / 1000)  + (24 * 60 *60 * 5), 1000, 0x3c40b6386f38d5b8218c812766b2e5e239fedf8ca3a75d0ba6f5b9142fc19923 , 0x3d68221571b94075b34396ab49ff0bc2217c65ec6129dbabd281485c306c3871 );
};
