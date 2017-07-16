pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Project Offer 
* What: Project Offers are used to create a transaction to send Ether or any other ERC-20 token held by Vega to an Ethereum address.
* Why: This is how Vega can invest in new coins or contracts on Ethereum that may not yet be listed on an exchange.
* Example: Should or should not Vega send 10,000 to X Coin token sale.
*
* ~~Potential Issues~~
*/
contract Project is Common {

	uint amount;
	address token;
	/**
	* @dev Main constructor for a Common offer
    * @param name A way to identify the title of the offer.
	* @param token The token used in the transaction. If not defined default to Ether.
	* @param amount The number of tokens to send.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the offer will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
	*/
    function Project (
		address _token,
		uint _amount
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
		token = _token;
		amount = _amount;
        name = _name;
        description = _description;
        duration = _duration;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {

    }
}