pragma solidity ^0.4.8;
import "../Common.sol";
/**@title Creation Proposal 
* Creation proposals are used to distribute more Vega Tokens.
*
* ~~Potential Issues~~
*/
contract Creation is Common, StakeVote {

    address contract;
    uint amount;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param contract The contract the tokens will be sent to.
    * @param amount The number of tokens to send.
    * @param vga The address for the VegaToken
	*/
    function Creation (
        address _contract,
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
        contract = _deposit;
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