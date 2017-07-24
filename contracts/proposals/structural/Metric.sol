pragma solidity ^0.4.8;
import "./Common.sol";
/**@title Metric Proposal 
* What: Metric Proposals are used to establish the desired outcome of the network.
* Why: It's critical to define what the goal of the network is because this metric is what defines how and what decisions are rewarded.
* Example: Vega tracks decision value in terms of the average of USD/ETH/BTC.
*
* ~~Potential Issues~~
*/
contract Metric is Common, StandardVote {

    bytes32 metric;

	/**
	* @dev Main constructor for a Common proposal
    * @param name A way to identify the title of the proposal.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the proposal will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    * @param metric Defines the new metric.
    * @param vga The address for the VegaToken
	*/
    function Metric (
        bytes32 _metric;
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
        metric = _metric;
    }

    /**
    * This function needs to handle any checks before the contract can be executed.
    * @dev Function used to cause the contract to execute.
    */
    function execute() public {
        address rewardAddress = this;
        vga.updateMetric(rewardAddress);
    }
}