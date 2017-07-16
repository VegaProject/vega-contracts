pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Finders Fee Offer 
* What: Finders Fee Offers establish the reward a finder should receive for an Offer that is executed and approved (voted in-support of).
* Why: Vega might want to encorage people to find valuable information, increase deal flow, or at times decrease the incentive.
* Example: The Project Offer to send Ether to the X Coin ICO received enough votes in-support to pass the quorum, 
*          therefore it was executed and approved, in return for the work performed by the creater of the Project Offer the 
*          creator will receive a fee of 7 Vega Tokens.
*/
contract FindersFee is Common {

    uint fee;
    uint multiple;

	/**
	* @dev Main constructor for a Common offer
    * @param name A way to identify the title of the offer.
	* @param token The token used in the transaction. If not defined default to Ether.
	* @param amount The number of tokens to send.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the offer will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param for The token received in exchange.
    * @param forAmount A number of tokens received.
    * @param orderPeriod How long the order will be available for.
	*/
    function FindersFee (
        uint _fee,
        uint _multiple
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        fee = _fee;
        multiple = _multiple;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        // Set metric in root token (VegaToken) to new metric
    }
}