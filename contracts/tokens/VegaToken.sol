pragma solidity ^0.4.15;

import "../../node_modules/minimetoken/contracts/MiniMeToken.sol";
import "../proposals/structural/Rewards.sol";
import "../StandardInterfaces/StandardTokenConversion.sol";
import "../proposals/structural/Quorum.sol";
import "../proposals/financial/Financial.sol";
import "../proposals/voting/StandardVote.sol";
import "../proposals/voting/StakeVote.sol";
import "../proposals/voting/Vote.sol";

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
        true
    )
    {

    }

    uint public quorum = 100;
    uint public reportingEvent;
    uint public minDecisionExp;
    uint public tokenConversion;


    function executeFinancialProposal(address _address) {
        Financial proposal = Financial(_address);
        Vote vote = Vote(proposal.vote());
        //Always update the quourum before checking a vote
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        address addr = address(this);
        MiniMeToken token = MiniMeToken(proposal.token());
        token.approve(_address, proposal.amount());
        proposal.execute(addr);
    }

    function executeQuorum(address _address) {
        Quorum proposal = Quorum(_address);
        Vote vote = Vote(proposal.vote());
        // Always update the quourum before checking a vote
        vote.updateQuorum(quorum);
        require(vote.isVotePassed());
        require(!vote.voteApplied());
        vote.applyVote();
        quorum = proposal.quorum();
    }

    function executeRewards(address _address) {
      Rewards proposal = Rewards(_address);
      Vote vote = Vote(proposal.vote());
      vote.updateQuorum(quorum);
      require(vote.isVotePassed());
      require(!vote.voteApplied());
      vote.applyVote();
      reportingEvent = proposal.reportingEvent();
      minDecisionExp = proposal.minDecisionExp();
      StandardTokenConversion sTC = StandardTokenConversion(proposal.tokenConversion());
      tokenConversion = sTC.tokenConversion;
      // if sTC.TokenConverion does not exist then do error checking and default the tokenConversion to 20% of the total supply.
    }


}
