pragma solidity ^0.4.15;

import "../../node_modules/minimetoken/contracts/MiniMeToken.sol";
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


}
