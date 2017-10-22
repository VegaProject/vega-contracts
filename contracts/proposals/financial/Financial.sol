pragma solidity ^0.4.15;

import "../Common.sol";

import "../../../node_modules/zeppelin-solidity/contracts/token/ERC20Basic.sol";

import "../voting/Vote.sol";


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
      function Financial (
          uint _duration,
          address _contract,
          address _token,
          uint256 _amount,
          address _vote
  	)    
    Common(
        _duration        
    ) 
    {
        vote = _vote;
        Vote aVote = Vote(vote);
        // Deposit weight needs to be dynamic
        require(aVote.getWeight(msg.sender) * 10000 > (_amount));
        to = _contract;
        token = _token;
        amount = _amount;
    }

    function execute(address _vga) public;



}
