pragma solidity ^0.4.11;
import "../Common.sol";
import "../voting/StandardVote.sol";


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

    uint public fee;
    uint  public multiple;
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function FindersFee (
        uint _fee,
        uint _multiple,
        address _vga
	)
    {
        fee = _fee;
        multiple = _multiple;
        vote = _vga;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
    }
}