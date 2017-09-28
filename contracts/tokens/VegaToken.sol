pragma solidity ^0.4.15;

import "../../node_modules/minimetoken/contracts/MiniMeToken.sol";
import "../proposals/structural/Rewards.sol";
import "../proposals/structural/Quorum.sol";
import "../proposals/structural/Metric.sol";
import "../proposals/structural/FindersFee.sol";
import "../proposals/structural/CreatorsDeposit.sol";
import "../proposals/voting/StandardVote.sol";
import "../proposals/voting/StakeVote.sol";

/// ::TODO::
/// 1. Hadcoded functions (updateQuorum, updateMetric)
/// need to be generalize to an updateStructure function
///
/// 2. addressed used to updateStructure must be approved. This should be the only HARDCODED
///    voting process. 
contract VegaToken is MiniMeToken {


    function VegaToken(address _factory)
    MiniMeToken(
        _factory,
        0x0,
        0,
        "Vga",
        18,
        "Vga",
        false
    )
    {

    }

    uint public localEvent;
    uint public  reporting;
    uint public  vestingEvent;
    uint public  vesting;
    uint public quorum;
    address public  metric;
    uint public  fee;
    uint public  multiple;
    uint public  deposit;
    address rewards;
    function updateRewards(address _address) public {
        rewards = _address;
    }
    // All of these functions need to be generalized; in order to do this we
    // need to create a mapping for structural properties. This will also allow
    // For the addition of structural properties at a later date.
    function updateQuorum(address _address) {
        Quorum quorumContract = Quorum(_address);
        StandardVote vote = StandardVote(quorumContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        quorum = quorumContract.quorum();
    }

    function updateMetric(address _address) {
        Metric metricContract = Metric(_address);
        StandardVote vote = StandardVote(metricContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        metric = metricContract.metric();
    }

    function updateFee(address _address) {
        FindersFee feeContract = FindersFee(_address);
        StandardVote vote = StandardVote(feeContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        fee = feeContract.fee();
        multiple = feeContract.multiple();
    }

    function updateDeposit(address _address) {
        CreatorsDeposit depositContract = CreatorsDeposit(_address);
        StandardVote vote = StandardVote(depositContract.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        deposit = depositContract.deposit();
    }

    function executeProposal(address _address) {
        Common common = Common(_address);
        Vote vote = StandardVote(common.vote());
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        deposit = common.execute();
    }
}
