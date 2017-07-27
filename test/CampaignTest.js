import ethClient from "ethconnector";
import assert from "assert"; // node.js core module
//import MiniMeToken from "../node_modules/minimetoken/contracts/MiniMeToken.sol";

//import VegaCampaign from "../js/givethcampaign";

const verbose = false;

describe("Giveth Campaign test test", () => {
    let escapeCaller;
    let escapeDestination;
    let securityGuard;
    let guest;
    let vegaCampaign;
    let miniMeToken;
    let now;

    before((done) => {
        ethConnector.init("testrpc", (err) => {
            if (err) { done(err); return; }
            escapeCaller = ethConnector.accounts[ 1 ];
            escapeDestination = ethConnector.accounts[ 2 ];
            securityGuard = ethConnector.accounts[ 3 ];
            guest = ethConnector.accounts[ 4 ];
            done();
        });
    });
    /*
    it("Get Now", (done) => {
        ethConnector.web3.eth.getBlock("latest", (err, block) => {
            assert.ifError(err);
            now = block.timestamp;
            done();
        });
    });
    it("should deploy all the contracts", (done) => {
        VegaCampaign.deploy(ethConnector.web3, {
            tokenName: "MiniMe Test Token",
            decimalUnits: 18,
            tokenSymbol: "MMT",
            escapeCaller,
            escapeDestination,
            absoluteMinTimeLock: 86400,
            timeLock: 86400 * 2,
            securityGuard,
            maxSecurityGuardDelay: 86400 * 21,
            startFundingTime: now - 86400,
            endFundingTime: now + (86400 * 365 * 30),
            maximumFunding: ethConnector.web3.toWei(10000),
        }, (err, _vegaCampaign) => {
            assert.ifError(err);
            assert.ok(_vegaCampaign.contract.address);
            vegaCampaign = _vegaCampaign;
            log("Giveth Campaign: " + vegaCampaign.contract.address);
            done();
        });
    }).timeout(20000);
    it("Should get minime token", (done) => {
        vegaCampaign.getState((err, _st) => {
            miniMeToken = new MiniMeToken(ethConnector.web3, _st.tokenAddress);
            done();
        });
    }).timeout(6000);
    it("Should donate", (done) => {
        vegaCampaign.donate({
            owner: guest,
            value: ethConnector.web3.toWei(10),
        }, (err) => {
            assert.ifError(err);
            miniMeToken.getState((err2, _st) => {
                assert.ifError(err2);
                assert.equal(_st.balances[ guest ], 10);
                done();
            });
        });
    }).timeout(6000);

    function log(S) {
        if (verbose) {
            console.log(S);
        }
    }
    */
});