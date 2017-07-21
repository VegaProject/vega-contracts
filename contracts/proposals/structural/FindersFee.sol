pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Finders Fee Proposal 
* What: Finders Fee Proposals establish the reward a finder should receive for an Proposal that is executed and approved (voted in-support of).
* Why: Vega might want to encorage people to find valuable information, increase deal flow, or at times decrease the incentive.
* Example: The Project Proposal to send Ether to the X Coin ICO received enough votes in-support to pass the quorum, 
*          therefore it was executed and approved, in return for the work performed by the creater of the Project Proposal the 
*          creator will receive a fee of 7 Vega Tokens.
*
* ~~Potential Issues~~
*/
contract FindersFee is Common {

    uint fee;
    uint multiple;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param fee Defines the new finders fee.
    * @param multiple Defines the new multiple from the initial creators deposit.
    * @param vga The address for the VegaToken
	*/
    function FindersFee (
        uint _fee,
        uint _multiple
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration,
        address _vga
    ) {
        fee = _fee;
        multiple = _multiple;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        // Set fee structure in root token (VegaToken) to new fee structure
    }
}