pragma solidity ^0.4.15;

import "../proposals/voting/Vote.sol";

contract CDRRewards {

	int startingValue;
	int currentValue;
	uint startingTime;
	Vote vote;
	address creator;

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

}