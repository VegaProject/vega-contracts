pragma solidity ^0.4.8;
/**@title Common Proposal 
* This proposal is meant to hold the minimum parameters and functions needed
* to execute an proposal.
*
* ~~Potential Issues~~
* Need to handle how vote counting is achieved.
*/
contract Common is Ownable {

    bytes32 name;
    string description;
    uint duration;
    uint startTime;
    enum ProposalStates { pending, failed, approved, denied };
    ProposalStates state = ProposalStates.pending;
    mapping (address => bool) private votes;
    /**
    * @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param vga The address for the VegaToken
    */
    function Common (
        bytes32 _name,
        string _description,
        uint _duration,
        address _vga
    ) {
        name = _name;
        description = _description;
        duration = _duration;
        startTime = block.timestamp;
        vga = _vga;
    }

    /**
    * This contract should check and ensure that the duration of the
    * proposal has not passed. If the duration for the contract has passed this contract
    * needs to inform the controlling contract.
    * alternatively we may consider using a contract like the ethereum alarm clock
    * @dev Basic method for casting a vote
    * @param inSupport True if voter supports the vote.
    */
    function vote(bool inSupport) {
        require(startTime + duration < block.timestamp);
        votes[msg.sender] = inSupport;
        // This function should alert the proposals controller on a vote cast
        // This will allow for the controlling function to check if this proposal can execute and
        // execute the proposal as needed.
    }

    /**
    * This handles only whether or not the contract is capable of executing.
    * Since each proposal will have a different behavior on execution 
    * @dev Asseses the state of the contract and returns true if the function can execute
    * @return returns true if the contract can execute and false if the contract cannot 
    */
    function canExecute() public constant returns (bool executable) {
        
    }


}