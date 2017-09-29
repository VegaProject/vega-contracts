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
      uint public amount;
      // Vote is stored in this token so that contracts with knowledge of this proposal can check it's vote state.
      address public vote;

  	/**
  	* @dev Main constructor for a Common proposal
      * @param _vga The address for the VegaToken
  	*/
      function Financial(
          address _contract,
          address _token,
          uint _amount,
          address _vote
  	) {
        to = _contract;
        token = _token;
        amount = _amount;
        vote = _vote;
    }
}
