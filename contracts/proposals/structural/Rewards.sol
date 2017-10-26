pragma solidity ^0.4.15;
import "../Common.sol";
import "../voting/StandardVote.sol";


/**@title Rewards Proposal
*/
contract Rewards is Common {

    uint public reportingEvent; // number of VegaPeriods
    uint public minDecisionExp; // number in VegaPeriods
    address public tokenConversion; // address to the contract which generates the tokenConversion rate.
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function Rewards (
        uint _reportingEvent,
        uint _minDecisionExp,
        address _tokenConversion,
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
        reportingEvent = _reportingEvent;
        minDecisionExp = _minDecisionExp;
        tokenConversion = _tokenConversion;
        vote = _vote;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute(address _vga) public{
    }
}
