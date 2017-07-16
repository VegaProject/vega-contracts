import async from "async";
import { deploy, sendContractTx, asyncfunc } from "runethtx";
import MiniMeToken from "../node_modules/minimetoken/contracts/MiniMeToken.sol";
import Vault from "vaultcontract";
import {
    VegaCampaignByteCode,
    VegaCampaignAbi,
} from "../contracts/VegaCampaign.sol.js";

export default class VegaCampaign {

    constructor(web3, address) {
        this.web3 = web3;
        this.contract = this.web3.eth.contract(VegaCampaignAbi).at(address);
    }

    getState(_cb) {
        return asyncfunc((cb) => {
            const st = {};
            async.series([
                (cb1) => {
                    this.contract.owner((err, _owner) => {
                        if (err) { cb1(err); return; }
                        st.owner = _owner;
                        cb1();
                    });
                },
                (cb1) => {
                    this.contract.tokenContract((err, _tokenAddress) => {
                        if (err) { cb1(err); return; }
                        st.tokenAddress = _tokenAddress;
                        cb1();
                    });
                },
                (cb1) => {
                    this.contract.vaultAddress((err, _vaultAddress) => {
                        if (err) { cb1(err); return; }
                        st.vaultAddress = _vaultAddress;
                        cb1();
                    });
                },
            ], (err2) => {
                if (err2) {
                    cb(err2);
                } else {
                    cb(null, st);
                }
            });
        }, _cb);
    }

    static deploy(web3, opts, _cb) {
        return asyncfunc((cb) => {
            const params = Object.assign({}, opts);
            let miniMeToken;
            let VegaCampaign;
            let vault;
            let owner;
            async.series([
                (cb1) => {
                    MiniMeToken.deploy(web3, opts, (err, _miniMeToken) => {
                        if (err) {
                            cb1(err);
                            return;
                        }
                        miniMeToken = _miniMeToken;
                        cb1();
                    });
                },
                (cb1) => {
                    Vault.deploy(web3, opts, (err, _vault) => {
                        if (err) {
                            cb1(err);
                            return;
                        }
                        vault = _vault;
                        cb1();
                    });
                },
                (cb1) => {
                    params.abi = VegaCampaignAbi;
                    params.byteCode = VegaCampaignByteCode;
                    params.tokenAddress = miniMeToken.contract.address;
                    params.vaultAddress = vault.contract.address;
                    deploy(web3, params, (err, _vegaCampaign) => {
                        if (err) {
                            cb1(err);
                            return;
                        }
                        vegaCampaign = new VegaCampaign(web3, _vegaCampaign.address);
                        cb1();
                    });
                },
                (cb1) => {
                    miniMeToken.contract.controller((err, _controller) => {
                        if (err) {
                            cb1(err);
                            return;
                        }
                        owner = _controller;
                        cb1();
                    });
                },
                (cb1) => {
                    miniMeToken.contract.changeController(vegaCampaign.contract.address, {
                        from: owner,
                    }, cb1);
                },
            ],
            (err) => {
                if (err) {
                    cb(err);
                    return;
                }
                cb(null, vegaCampaign);
            });
        }, _cb);
    }

    donate(opts, cb) {
        return sendContractTx(
            this.web3,
            this.contract,
            "proxyPayment",
            opts,
            cb);
    }

}