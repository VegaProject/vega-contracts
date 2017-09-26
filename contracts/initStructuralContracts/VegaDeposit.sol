pragma solidity 0.4.15;

import '../helpers/Math.sol';

contract VegaDeposit is Math {
	    
	
  ///@notice minDeposit will return the Minimum Deposit needed in VNT to create an allocation contract.
  ///@param _requestedValue is the amount of value requested to be sent in a allocation contract.
  function minDeposit(uint _requestedValue) public constant returns (uint) {
       uint minDepositV = multiplyPercentage(_requestedValue, 1, 1000);
       return minDepositV;
   }
}
