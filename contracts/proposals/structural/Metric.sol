pragma solidity ^0.4.15;
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

    address public metric;

	/**
	* @dev Main constructor for a Common proposal
	*/
    function Metric (
        address _metric
	) {
        metric = _metric;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
    }
}
