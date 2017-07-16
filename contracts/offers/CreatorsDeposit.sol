pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Creators Deposit Offer 
* What: Creators Deposit Offers establish the required deposit amount for an offer to be created. 
* Why: Vega would like to discorage Offer spamming and make those submiting offers to have some skin in the game.
*/
contract CreatorsDeposit is Common {

    uint deposit;

	/**
	* @dev Main constructor for a Common offer
    * @param name A way to identify the title of the offer.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the offer will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param deposit Defines the new deposit amount.
	*/
    function Rewards (
        bytes32 _deposit;
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        deposit = _deposit;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        /// Set the creators deposit for the main token(VGA) to the deposit stated in this offer
    }
}