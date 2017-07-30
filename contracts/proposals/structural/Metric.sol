pragma solidity ^0.4.11;
import "../Common.sol";
import "../voting/StandardVote.sol";


/**@title Metric Proposal 
* What: Metric Proposals are used to establish the desired outcome of the network.
* Why: It's critical to define what the goal of the network is because this metric is what defines how and what decisions are rewarded.
* Example: Vega tracks decision value in terms of the average of USD/ETH/BTC.
*
* ~~Potential Issues~~
*/
contract Metric is Common {

    bytes32 public metric;
    address public vote;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function Metric (
        bytes32 _metric,
        address _vga
	)
    {
        metric = _metric;
        vote = _vga;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
    }
}
