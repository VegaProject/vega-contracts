pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Exchange Offer 
* What: Exchange Offers are used to create a transaction to place an order or make an order on a decentralized exchange to exchange one contract for another.
* Why: The network needs to have the ability to adapt to current markets and exchange contracts for others.
* Example: Vega trades it's X Coins for Ether through the 0x Protocol.
*
* ~~Potential Issues~~
* In order for this offer to work it would seem that there needs
* to be more progress on the front of creating a unified standard for the trade of ERC20 tokens (Ox protocol)
*/
contract Exchange is Common {

	uint amount;
	address token;
    address exchangeToken;
    uint exchangeAmount;
    uitn orderPeriod;
	/**
	* @dev Main constructor for a Common offer
    * @param name A way to identify the title of the offer.
	* @param token The token used in the transaction. If not defined default to Ether.
	* @param amount The number of tokens to send.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the offer will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param exchangeToken The token received in exchange.
    * @param exchangeAmount A number of tokens received.
    * @param orderPeriod How long the order will be available for.
	*/
    function Exchange (
		address _token,
		uint _amount,
        address _exchangeToken,
        uint _exchangeAmount,
        uint _orderPeriod
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        amount = _amount;
        token = _token;
        exchangeToken = _exchangeToken;
        exchangeAmount = _exchangeAmount;
        orderPeriod = _orderPeriod;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        // When this order is placed it needs to place an order
        // or make an order through a decentralized exchange.
        // In order to achieve this behavior there needs to be an established decentralized exchange.
    }
}