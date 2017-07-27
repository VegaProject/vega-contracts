pragma solidity ^0.4.11;
import "../tokens/VegaToken.sol";
import "../helpers/Owned.sol";


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
    VegaToken vga;
    enum ProposalStates { pending, failed, approved, denied }
    ProposalStates state = ProposalStates.pending;
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
        vga = VegaToken(_vga);
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