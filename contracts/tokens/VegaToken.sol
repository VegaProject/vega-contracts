pragma solidity ^0.4.6;

import "../../node_modules/minimetoken/contracts/MiniMeToken.sol";
import "../proposals/structural/Rewards.sol";
import "../proposals/structural/Quorum.sol";
import "../proposals/structural/Metric.sol";
import "../proposals/structural/FindersFee.sol";
import "../proposals/structural/CreatorsDeposit.sol";
import "../proposals/voting/StandardVote.sol";
import "../proposals/voting/StakeVote.sol";

contract VegaToken is MiniMeToken(){


    function VegaToken(address _factory)
    MiniMeToken(
        _factory,
        0x0,
        0,
        "Vga",
        18,
        "Vga",
        false
    ){

    }

    uint public localEvent;
    uint public  reporting;
    uint public  vestingEvent;
    uint public  vesting;
    uint public quorum;
    bytes32 public  metric;
    uint public  fee;
    uint public  multiple;
    uint public  deposit;
    address rewards;
    function updateRewards(address _address) public {
        rewards = _address;
    }

    function updateQuorum(address _address) {
        Quorum quorumContract = Quorum(_address);
        StandardVote vote = StandardVote(quorumContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(vote.voteApplied());
        vote.applyVote();         
        quorum = quorumContract.quorum();
    }
    
    function updateMetric(address _address) {
        Metric metricContract = Metric(_address);
        StandardVote vote = StandardVote(metricContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(vote.voteApplied());
        vote.applyVote();        
        metric = metricContract.metric();
    }

    function updateFee(address _address) {
        FindersFee feeContract = FindersFee(_address);
        StandardVote vote = StandardVote(feeContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(vote.voteApplied());
        vote.applyVote();         
        fee = feeContract.fee();
        multiple = feeContract.multiple();
    }

    function updateDeposit(address _address) {
        CreatorsDeposit depositContract = CreatorsDeposit(_address);
        StandardVote vote = StandardVote(depositContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(vote.voteApplied());
        vote.applyVote();  
        deposit = depositContract.deposit();
    }        
}