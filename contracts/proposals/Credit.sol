pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Credit Proposal 
* What: Credit Proposals are used to allow a Project or Exchange Proposal to be executed but done through borrowed tokens. 
* Why: Sometimes its a better move to take on debt, use leveraged fund on medium to talk more about points here. 
* Example: Vega decides to borrow 10,000 Ether in addition to the 10,000 of its own to send to the X Coin token sale, 
*          then after 150 days Vega returns 15,000 Ether to the lenders.
*
* ~~Potential Issues~~
* Do we need something on 0x protocol for this to work?
*/
contract Credit is Common {

    uint proposalId;
    address token;
    uint credit;
    uint value;
    uint collateral;
    uint expiration;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
	* @param proposalId Which proposal the credit is going to.
    * @param token The token used in the transaction. If not defined default to Ether.
	* @param credit Defines the amount of new tokens to borrow.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param value Defines the amount of tokens that will be sent back.
    * @param collateral Defines the amount of Vega Tokens that will be posted as collateral.
    * @param expiration Defines when this contract will expire.
	*/
    function Credit (
        uint _proposalId,
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
        proposalId = _proposalId;
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
        // Initiate a credit action on the indicated proposal through the VT
    }
}