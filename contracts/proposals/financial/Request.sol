pragma solidity ^0.4.11;
import "../Common.sol";
import "../voting/StakeVote.sol";


/**@title Request Proposal 
* Request proposals are used to allow other contracts or accounts hire Vega. Tokens used in a request
* proposal give Vega the right to all of their features defined by their contract, however, Vega cannot
* spend them through an Allocation proposal. You can think of these proposals as almost the reverse of an
* Allocation proposal. They give Vega the right to manage tokens on behalf of another entity, in exchange
* for some kind of contract.
*
* ~~Potential Issues~~
*/
contract Request is Common, StakeVote {

    address public instance;
    address public token;
    uint amount;

	/**
	* @dev Main Request for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param contract The contract the tokens will be sent to.
    * @param token The token used in the transaction. If not defined default to Ether.
    * @param amount The number of tokens to send.
    * @param vga The address for the VegaToken
    */
    function Request (
        address _contract,
        address _token,
        uint _amount
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration,
        address _vga
    )
    StakeVote (
        address _vga        
    ) 
    {
        instance = _contract;
        token = _token;
        amount = _amount;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        // Set metric in root token (VegaToken) to new metric
    }

}