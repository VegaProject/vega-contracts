pragma solidity ^0.4.15;

import "./Owned.sol";

contract TokenConversion is Owned {

  uint public tokenConversion;

  function TokenConversion() {
    tokenConversion = 0;
  }

  function changeTokenConversion(uint _newTokenConversion) onlyOwner {
    tokenConversion = _newTokenConversion;
  }

}
