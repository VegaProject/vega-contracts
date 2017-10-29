pragma solidity ^0.4.15;

import "../proposals/voting/Vote.sol";
import "../helpers/CDRCalculator.sol";

contract CDRRewards {

	int startingValue;
	int currentValue;
	uint startingTime;
	Vote vote;
	address creator;

	struct VoterRewards {
		uint currentStake;
		uint lastPeriodPaid;
	}

	mapping (address => VoterRewards) public voterRewards;

	function CDRRewards (
		int _startingValue,
		address _vote,
		address _creator
	) {
		startingValue = _startingValue;
		startingTime = now;
		vegaPeriod = _vegaPeriod;
		vote = Vote(_vote);
		creator = _creator;
	}

	function setCurrentValue(int _currentValue) public {
		currentValue = _currentValue;
	}

	function getVegaPeriod() internal returns(uint vegaPeriods){
		timeRemainder = (now - startingTime) % vegaPeriod;
		vegaPeriods = (now - startingTime - timeRemainder) / vegaPeriod;
	}

	// Getting a method that will handle totalRewards is going to be a challenge
	function claimRewards(uint totalRewards, uint tokenConversion) {
		uint vPeriod = getVegaPeriod();
		while(voterRewards(address).lastPeriodPaid != vPeriod){
			if(voterRewards(address).lastPeriodPaid == 0){
				uint stake = vote.votes(
					vote.statusMap(msg.sender).voteIndex
					).weight;
				if(msg.sender == creator){
					stake = 125 * stake / 100;
				} 
				voterRewards.currentStake = stake;
			}
			// This needs to get the value at correct blocktime
			int rod = CDRCalculator.returnOnDecision(currentValue, startingValue);
			int cVPGR = CDRCalculator.returnCVPGR(rod, ++voterRewards(address).lastPeriodPaid);
			int reward = CDRCalculator.reward(voterRewards.currentStake, cVPGR);
			voterRewards.currentStake += CDRCalculator.tokens(reward, totalRewards, tokenConversion);
		}
	}
}