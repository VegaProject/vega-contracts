pragma solidity ^0.4.11;
import "./Vote.sol";
import "../../../node_modules/minimetoken/contracts/MiniMeToken.sol";
import "../../tokens/VegaToken.sol";
import "../Common.sol";

contract StakeVote is Vote {
    VegaToken vga;
    Common common;

    function StakeVote(address _vga){
        vga = VegaToken(_vga);
    }

    // Currently vote will only allow the voter to change their voting position and add weight into their current
    // Voting position. It may make sense to move the addition of weight into another function.
    function vote(bool inSupport) public {
        require(common.openForVoting());
        VoteStatus memory status = statusMap[msg.sender];
        bool hasVoted = status.hasVoted;
        address voteAddress = this;
        uint stake = vga.allowance(msg.sender, voteAddress);
        if (hasVoted) {
            votes[status.voteIndex].inSupport = inSupport;
            if (stake > 0) {
                vga.transferFrom(msg.sender, voteAddress, stake);
                votes[status.voteIndex].weight = votes[status.voteIndex].weight + stake;
            }
        } else {
            vga.transferFrom(msg.sender, voteAddress, stake);            
            votes.push(VoteInfo(msg.sender, inSupport, stake));
        }
    }

    // TODO:: Implement a SAFE withdraw function
    function countVote() public returns (bool counted) {
        uint voteWeight;
        for (uint i = 0; i < votes.length; i++) {
            voteWeight = votes[i].weight;
            if (votes[i].inSupport) {
                yayWeight = yayWeight + voteWeight;
            } else {
                nayWeight = nayWeight + voteWeight;
            }
        }
        return true;
    }
}
