pragma solidity ^0.4.15;
import "../Common.sol";
import "../voting/StandardVote.sol";


/**@title Quorum Proposal 
* What: Quorum Proposals are used to establish the minimum amount of tokens needed to execute an proposal.
* Why: A dynamic quorum is necessary because at some point Vega may want to make decisions quickly and 
*      not require as much consensus, at others it may need or seek to require a greater amount of consensus.
* Example: Vega sets the Quorum to 100,000 Vega Tokens.
*
* ~~Potential Issues~~
*/
contract Quorum is Common {

    uint public quorum;
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function Quorum (
        uint _quorum,
        address _vote,
	bytes32 _title,
	string _description,
        uint _duration               
	)
    Common(
	_title,
	_description,
        _duration        
    )
    {
        quorum = _quorum;
        vote = _vote;
    }


    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute(address _vga) public{
    }
}
