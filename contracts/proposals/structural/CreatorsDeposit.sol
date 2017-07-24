pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Creators Deposit Proposal 
* What: Creators Deposit Proposals establish the required deposit amount for an proposal to be created. 
* Why: Vega would like to discorage Proposal spamming and make those submiting proposals to have some skin in the game.
* Example: Vega sets the Creators Deposit to 2 Vega Tokens.
*
* ~~Potential Issues~~
*/
contract CreatorsDeposit is Common, StandardVote {

    uint deposit;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param deposit Defines the new deposit amount.
    * @param vga The address for the VegaToken
	*/
    function Rewards (
        bytes32 _deposit;
	) 
	Common (
        bytes32 _name,
        string _description,
        uint _duration,
        address _vga
    )
    StandardVote (
        address _vga        
    ) 
    {
        deposit = _deposit;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        address rewardAddress = this;
        vga.updateDeposit(rewardAddress);
    }
}