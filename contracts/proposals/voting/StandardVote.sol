pragma solidity ^0.4.8;

import "../helpers/Owned.sol";
import "../Common.sol";
import "../../tokens/VegaToken.sol";

contract StandardVote is Owned {

    function StandardVote ()
    Vote(
        address _vga
    ){ }
    /**
    * This contract should check and ensure that the duration of the
    * proposal has not passed. If the duration for the contract has passed this contract
    * needs to inform the controlling contract.
    * alternatively we may consider using a contract like the ethereum alarm clock
    * @dev Basic method for casting a vote
    * @param inSupport True if voter supports the vote.
    */
    function vote(bool inSupport) public {
        require(common.openForVoting());
        if(status(msg.sender).hasVoted){
            votes[status(msg.sender).hasVoted].inSupport = inSupport;
        } else {
            votes.push(Vote(msg.sender, inSupport));
        }
        votes[msg.sender] = inSupport;
    }

    function countVote() public returns (bool counted) {
        uint voteWeight;
        for (uint i = 0; i < votes.length; i++) {
            voteWeight = vga.balanceOfAt(votes(i).voter, block.number);
            if (votes(i).inSupport) {
                yayWeight = yayWeight + voteWeight;
            } else {
                nayWeight = nayWeight + voteWeight;
            }
        }
    }

    function quorumReached() public constant (bool isReached) {
        uint totalWeight = yayWeight +nayWeight; 
        return (totalWeight >= vga.quorum());
    }

    function consensusReached() public constant (bool isReached) {
        return (yayWeight > nayWeight);
    }

    function isVotePassed() public constant returns (bool votePassed) {
        require(!common.openForVoting());
        require(quorumReached());
        require(consensusReached());
        return true;
    }
}
