pragma solidity ^0.4.15;
import "../Common.sol";
import "../voting/StandardVote.sol";


/**@title Creators Deposit Proposal 
* What: Creators Deposit Proposals establish the required deposit amount for an proposal to be created. 
* Why: Vega would like to discorage Proposal spamming and make those submiting proposals to have some skin in the game.
* Example: Vega sets the Creators Deposit to 2 Vega Tokens.
*
* ~~Potential Issues~~
*/
contract CreatorsDeposit is Common {

    uint public deposit;
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
    * @param _vga The address for the VegaToken
	*/
    function CreatorsDeposit(
        uint _deposit,
	)
    {
        deposit = _deposit;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
    }
}