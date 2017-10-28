pragma solidity ^0.4.15;
import "../Common.sol";
import "../voting/StandardVote.sol";


/**@title Time Proposal
*/
contract Time is Common {

    int public time;
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function Time (
        int _blocksInVegaPeriod,
        address _vote,
        uint _duration
	)
    Common(
      _duration
    )
    {
        time = _blocksInVegaPeriod;
        vote = _vote;
    }


    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute(address _vga) public{
    }
}
