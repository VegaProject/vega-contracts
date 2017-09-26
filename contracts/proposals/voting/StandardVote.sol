pragma solidity ^0.4.15;

import "./Vote.sol";
import "../../tokens/VegaToken.sol";
import "../Common.sol";

contract StandardVote is Vote {

    VegaToken vga;
    Common common;

    function StandardVote(address _common, address _vga){
        common = Common(_common);
        vga = VegaToken(_vga);
    }

    /**
    * This contract should check and ensure that the duration of the
    * proposal has not passed. If the duration for the contract has passed this contract
    * needs to inform the controlling contract.
    * alternatively we may consider using a contract like the ethereum alarm clock
    * @dev Basic method for casting a vote
    * @param inSupport True if voter supports the vote.
    */
    function vote(bool inSupport) public {
        bool hasVoted;
        require(common.openForVoting());
        VoteStatus memory status = statusMap[msg.sender];
        if (hasVoted = status.hasVoted) {
            votes[status.voteIndex].inSupport = inSupport;
        } else {
            votes.push(VoteInfo(msg.sender, inSupport, votes.length));
            status = VoteStatus(true, votes.length - 1);
            statusMap[msg.sender] = status;
        }
    }

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