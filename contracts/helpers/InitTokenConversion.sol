pragma solidity ^0.4.15;
/*
    Copyright 2017, George K. Van Hoomissen

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/// @title InitTokenConversion
/// @author George K. Van Hoomissen
/// @dev Initial contract to calculate tokenConversion.

contract StandardTokenConversion {
    uint public tokenConversion;
    function updateTokenConversion() returns (bool success);
    event UpdateTokenConversion();
}

contract InitTokenConversion is StandardTokenConversion {
    function multiplyPercentage(uint _value, uint _numerator, uint _denominator) public constant returns (uint) {
       uint value = (_value * _numerator) / _denominator;
       return value;
    }

    uint totalSupply = 1000000000000;

    function updateTokenConversion() returns (bool success) {
       tokenConversion = multiplyPercentage(totalSupply, 100, 500);
       return true;
  }
