pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Quorum Proposal 
* What: Quorum Proposals are used to establish the minimum amount of tokens needed to execute an proposal.
* Why: A dynamic quorum is necessary because at some point Vega may want to make decisions quickly and 
*      not require as much consensus, at others it may need or seek to require a greater amount of consensus.
* Example: Vega sets the Quorum to 100,000 Vega Tokens.
*
* ~~Potential Issues~~
*/
contract Quorum is Common {

    uint quorum;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param quorum Defines the new quorum.
    * @param vga The address for the VegaToken
	*/
    function Rewards (
        bytes32 _quorum;
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration,
        address _vga
    ) {
        quorum = _quorum;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        /// Set the quorum for the main token(VGA) to the quorum stated in this proposal
    }
}