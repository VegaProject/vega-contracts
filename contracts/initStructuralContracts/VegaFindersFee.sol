pragma solidity ^0.4.15;

import '../helpers/Math.sol';

contract VegaFindersFee is Math {
	    
  ///@notice findersFeeVoteStake will return the current stake amount a creator will receive.
  ///@param _deposit is the proposal Deposit in VNT
  ///@param _approved is true if the proposal is in the Approved state, and false if in the Denied state.
  function findersFeeVoteStake(uint _deposit, bool _approved) public constant returns (uint) {
	if(_approved == false) {
		uint stake = _deposit;
	} else {
		stake = multiplyPercentage(_deposit, 5, 4)
       	}
	return stake;
  }
}

