pragma solidity ^0.4.8;
import "../Common.sol";
/**@title Allocation Proposal 
* Allocation proposals send tokens held by Vega to another contract or address. This contract could be a token sale,
* prediction market, exchange or lending contract for example.
*
* ~~Potential Issues~~
*/
contract Allocation is Common, StakeVote {

    address contract;
    address token;
    uint amount;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param contract The contract the tokens will be sent to.
    * @param token The token used in the transaction. If not defined default to Ether.
    * @param amount The number of tokens to send.
    * @param vga The address for the VegaToken
	*/
    function Allocation (
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
        contract = _deposit;
        token = _token;
        amount = _amount;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        /// Set the creators deposit for the main token(VGA) to the creators deposit stated in this proposal
    }
}