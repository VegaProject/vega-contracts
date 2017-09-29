pragma solidity ^0.4.15;
import "../Common.sol";

import "../../../node_modules/minimetoken/contracts/MiniMeToken.sol";
import "./Financial.sol";

/**@title Allocation Proposal
* Allocation proposals send tokens held by Vega to another contract or address. This contract could be a token sale,
* prediction market, exchange or lending contract for example.
*
* ~~Potential Issues~~
*/
contract Allocation is Financial {


      /**
      * This function needs to handle any checks before the contract can be executed.
      * This is function relies on the calling token
      * @dev Function used to cause the contract to execute.
      */
      function execute(address _vga) public {
          MiniMeToken txToken = MiniMeToken(token);
          txToken.transferFrom(_vga, to, amount);

      }
}
