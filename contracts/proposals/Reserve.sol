pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Rserve Proposal 
* What: Reserve Proposals establish how many tokens received through a Creators Proposal should be allocated only to Project Proposals that have aready 
*       been approved once before, and are approved again.
* Why: Sometimes Project and Exchange Proposals will benifit more from concentrated multiple rounds of execution rather than just a single one.
*
* ~~Potential Issues~~
*/
contract Reserve is Common {

    uint reserve;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param reserve Defines the new reserve amount as a % of a token raise from a creation proposal.
	*/
    function Rewards (
        uint _reserve;
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        reserve = _reserve;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        /// Set a reserve on the main vega token to the reserve specified in this proposal.
    }
}