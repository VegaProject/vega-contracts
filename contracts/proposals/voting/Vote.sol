pragma solidity ^0.4.15;

import "../../helpers/Owned.sol";


contract Vote is Owned {

    uint yayWeight = 0;
    uint nayWeight = 0;
    bool public voteApplied = false;
    uint quorum = 100;

    struct VoteInfo {
        address voter;
        bool inSupport;
        uint weight;
    }

    VoteInfo[] public votes;

    struct VoteStatus {
        bool hasVoted;
        uint voteIndex;
    }

    mapping (address => VoteStatus) public statusMap;


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

    function updateQuorum(uint _quorum) {
        quorum = _quorum;
    }

    function quorumReached() public constant returns (bool isReached) {
        uint totalWeight = yayWeight + nayWeight;
        isReached = totalWeight >= quorum;
        return isReached;
    }

    function consensusReached() public constant returns (bool isReached) {
        isReached = yayWeight > nayWeight;
        return isReached;
    }

    function isVotePassed() public constant returns (bool votePassed) {
        require(quorumReached());
        require(consensusReached());
        return true;
    }
    function applyVote() public onlyOwner {
        voteApplied = true;
    }

    function getWeight(address _addr) public constant returns(uint weight) {
         weight = votes[statusMap[_addr].voteIndex].weight;
    }
}
