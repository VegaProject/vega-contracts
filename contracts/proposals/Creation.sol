pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Creation Proposal 
* What: Creation Proposals are used to distribute more Vega Tokens via a reverse auction.
* Why: Sometimes the network will need to distribute more tokens to allow for growth.
* Example: Vega decides to incorage new participants to join the network so it distributes 5,000 Vega Tokens via a reverse auction.
*
* ~~Potential Issues~~
*/
contract Creation is Common {

    bytes32 amount;

	/**
	* @dev Main constructor for a Creation proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param amount Defines the amount of new Vega Tokens to create.
	*/
    function Creation (
        bytes32 _amount;
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        amount = _amount;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        // Executes a creation action for the main token (VT)
        // This could have some issues with security
        // In addition if token structures will be used for creation
        // that needs to be accounted for.
    }
}