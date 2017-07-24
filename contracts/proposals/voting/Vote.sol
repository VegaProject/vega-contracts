pragma solidity ^0.4.8;

import "../Common.sol";
import "../../tokens/VegaToken.sol";

contract Vote is Owned {

    uint yayWeight = 0;
    uint nayWeight = 0;
    address common;
    address vga;
    bool voteApplied;

    struct Vote {
        address voter;
        bool inSupport;
        uint weight;
    }

    Vote[] votes;

    struct voteStatus{
        bool hasVoted;
        uint voteIndex;
    }
    mapping (address => voteStatus) private status;

    function Vote (address _vga){
        address voteAddress = this;
        common = Common(voteAddress);
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
    function vote(bool inSupport) public;

    function countVote() public returns (bool counted);

    function quorumReached() public constant (bool isReached) {
        uint totalWeight = yayWeight +nayWeight; 
        return (totalWeight >= vga.quorum());
    }

    function consensusReached() public constant (bool isReached) {
        return (yayWeight > nayWeight);
    }

    function isVotePassed() public constant returns (bool votePassed) {
        require(!common.openForVoting());
        totalWeight = yayWeight + nayWeight;
        require(quorumReached());
        require(consensusReached());
        return true;
    }

    function applyVote() public onlyOwner {
        voteApplied = true;
    }
}
