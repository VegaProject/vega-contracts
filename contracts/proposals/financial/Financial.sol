pragma solidity ^0.4.15;
import "../Common.sol";

import "../../../node_modules/zeppelin-solidity/contracts/token/ERC20Basic.sol";


/**@title Allocation Proposal
* Allocation proposals send tokens held by Vega to another contract or address. This contract could be a token sale,
* prediction market, exchange or lending contract for example.
*
* ~~Potential Issues~~
*/
contract Financial is Common {

      address public to;
      address public token;
      uint256 public amount;
      // Vote is stored in this token so that contracts with knowledge of this proposal can check it's vote state.
      address public vote;

  	/**
  	* @dev Main constructor for a Common proposal
  	*/
      function Financial(
          bytes32 _title,
	  string _description,
	  uint _duration,
          address _contract,
          address _token,
          uint256 _amount,
          address _vote
  	)    
    Common(
	_title,
	_description,
        _duration        
    ) {
        to = _contract;
        token = _token;
        amount = _amount;
        vote = _vote;
    }

    function execute(address _vga) public;
}
