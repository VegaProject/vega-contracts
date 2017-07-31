pragma solidity ^0.4.11;

import "../helpers/Owned.sol";

/**@title Common Proposal
* This proposal is meant to hold the minimum parameters and functions needed
* to execute an proposal.
*
* ~~Potential Issues~~
* Need to handle how vote counting is achieved.
*/
contract Common is Owned {
    bytes32 name;
    string description;
    uint duration;
    uint startTime;
    enum ProposalStates { pending, failed, approved, denied }
    ProposalStates state = ProposalStates.pending;
    /**
    * @dev Main constructor for a Common proposal
    */
    function Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        name = _name;
        description = _description;
        duration = _duration;
        startTime = block.timestamp;
    }

    /**
    * This handles only whether or not the contract is capable of executing.
    * Since each proposal will have a different behavior on execution
    * @dev Asseses the state of the contract and returns true if the function can execute
    * @return returns true if the contract can execute and false if the contract cannot
    */
    function canExecute() public constant returns (bool executable) {
        require(state == ProposalStates.approved);
        return true;
    }

    function openForVoting() public constant returns (bool stillOpen) {
        return (block.timestamp < startTime + duration);
    }

}
