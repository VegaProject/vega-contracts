pragma solidity ^0.4.15;
import "../Common.sol";


/**@title Rewards Proposal 
* What: Sets when a rewards event takes place.
* Why: Needs to change based on the current market and block time factors of Ethereum.
* Example: Every 6,000 blocks a decision reward event takes place.
*
* ~~Potential Issues~~
*/
contract Rewards is Common {

    uint public localEvent;
    uint public reporting;
    uint public vestingEvent;
    uint public vesting;
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function Rewards (
        uint _localEvent,
        uint _reporting,
        uint _vestingEvent,
        uint _vesting,
        address _vga
	)
    {
        localEvent = _localEvent;
        reporting = _reporting;
        vestingEvent = _vestingEvent;
        vesting = _vesting;
        vote = _vga;
    }

}