pragma solidity ^0.4.11;


contract StakeVote is Vote {
    function StakeVote ()
    Vote(
        address _vga
    )
    { }
    
    // Currently vote will only allow the voter to change their voting position and add weight into their current
    // Voting position. It may make sense to move the addition of weight into another function.
    function vote(bool inSupport) public {
        require(common.openForVoting());
        VoteStatus status = status(msg.sender);
        bool hasVoted = status.hasVoted;
        address voteAddress = this;
        uint stake = vga.allowance(msg.sender, voteAddress);
        if (hasVoted) {
            votes[hasVoted].inSupport = inSupport;
            if (vga.allowance(msg.sender, voteAddress) > 0) {
                vga.transferFrom(msg.sender, voteAddress, stake);
                votes[hasVoted].weight = votes[hasVoted].weight + stake;
            }
        } else {
            vga.transferFrom(msg.sender, voteAddress, stake);            
            votes.push(Vote(msg.sender, inSupport, stake));
        }
        votes[msg.sender] = inSupport;
    }

    // TODO:: Implement a SAFE withdraw function
    */
    function isVotePassed() public constant returns (bool votePassed) {
        uint yayWeight = 0;
        uint nayWeight = 0;
        uint totalWeight = 0;
        uint quorum = vga.quorum();
        uint voteWeight;
        for (uint i = 0; i < votes.length; i++) {
            voteWeight = votes(i).weight;
            if (votes(i).inSupport) {
                yayWeight = yayWeight + voteWeight;
            } else {
                nayWeight = nayWeight + voteWeight;
            }
        }
        require(yayWeight > nayWeight);
        totalWeight = yayWeight + nayWeight;
        require(totalWeight >= quorum);
        return true;
    }
}
