pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Rewards Proposal 
* What: Sets when a rewards event takes place.
* Why: Needs to change based on the current market and block time factors of Ethereum.
* Example: Every 6,000 blocks a decision reward event takes place.
*
* ~~Potential Issues~~
*/
contract Rewards is Common {

    uint event;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param event Sets when and how often decision reward events take place based on a block count.
    * @param vga The address for the VegaToken
	*/
    function Rewards (
        unit _event;
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration,
        address _vga
    ) {
        event = _event;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        /// Set the event on the main vega token to to event for this proposal.
    }
}