pragma solidity ^0.4.15;

import './Math.sol';
/*
/// @title CDRCalculator
/// @description helper functions used to calculate CDR for voters
*/

contract CDRCalculator is Math {

  /*
  * Currently only able to handle limited uses of positive numbers and no fractions.
  */

  function returnOnDecision(uint _currentValue, uint _startingValue) public constant returns (uint) {
       uint rod = percent(_currentValue, _startingValue, 0);
       return rod;
   }

   function cagr(uint _rod, uint _vegaPeriods) public constant returns (uint) {
       uint exp = percent(1, _vegaPeriods, 0);
       uint cagrV = _rod**exp-1;
       return cagrV;
   }

   function reward(uint _stake, uint _cagr) public constant returns (uint) {
       uint rewardV = _stake * _cagr;
       return rewardV;
   }

   function tokens(uint _rewards, uint _absTotalRewards, uint _tokenConversion) public constant returns (uint) {
       uint tokensV = multiplyPercentage(_tokenConversion, _rewards, _absTotalRewards);
       return tokensV;
   }
}
