pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Project Offer 
* In order for this offer to work it would seem that there needs
* to be more progress on the front of creating a unified standard for the trade of ERC20 tokens (Ox protocol)
*/
contract Credit is Common {

    uint offerId;
    address token;
    uint credit;
    uint value;
    uint collateral;
    uint expiration;

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
    function Credit (
        uint _offerId,
        address _token,
        uint _credit,
        uint _value,
        uint _collateral,
        uint _expiration
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        offerId = _offerId;
        token = _token;
        credit = _credit;
        value = _value;
        collateral = _collateral;
        expiration = _expiration;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        // Set metric in root token (VegaToken) to new metric
    }
}