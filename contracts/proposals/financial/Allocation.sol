pragma solidity ^0.4.11;
import "../Common.sol";

import "../voting/StakeVote.sol";


/**@title Allocation Proposal
* Allocation proposals send tokens held by Vega to another contract or address. This contract could be a token sale,
* prediction market, exchange or lending contract for example.
*
* ~~Potential Issues~~
*/
contract Allocation is Common {

      address public to;
      address public token;
      uint public amount;
      address public vote;

  	/**
  	* @dev Main constructor for a Common proposal
      * @param _vga The address for the VegaToken
  	*/
      function Allocation(
          address _contract,
          address _token,
          uint _amount,
          address _vga
  	)
      {
          to = _contract;
          token = _token;
          amount = _amount;
          vote = _vga;
      }

      /**
      * This function needs to handle any checks before the contract can be executed.
      * @dev Function used to cause the contract to execute.
      */
      function execute() public {
      }
}
