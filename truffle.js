var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "< insert your infura api key here >";
var mnemonic = "< insert your metamask 12-word pass phrase here >";

module.exports = {
  networks: {
    "ropsten": {
      network_id: 3, // Local Ethereum test network
      host: "127.0.0.1",
      port: 8545,
    },
    "ropsten-infura": {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3 // Official Ethereum test network
    },
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
  }
};
