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

/// @title DynamicQuorum
/// @author George K. Van Hoomissen
/// @dev This contract dynamically generates a voting quorum, based on staking participation levels.

contract StandardQuorum {
    uint public quorum;
}

contract DynamicQuorum is StandardQuorum {

    // currentQuorum is the required quorum at the currnet Vega Period.
    // avgAbsStakePerVegaPeriod is the average of the absolute value of all proposal stakes in a given Vega Period.
    uint public currentQuorum;
    uint public avgAbsStakePerVegaPeriod;
    uint public quorum = currentQuorum;

    ///@notice sets the initial quorum at 20 million tokens.
    function DynamicQuorum() {
        currentQuorum = 200000000000;
        avgAbsStakePerVegaPeriod = 0;
    }

    ///@param _avgAbsStakePerVegaPeriod is the new average level of participation.
    function newData(uint _avgAbsStakePerVegaPeriod) internal {
        avgAbsStakePerVegaPeriod = _avgAbsStakePerVegaPeriod;
    }

    ///@notice 'quorum()' is used to establish the new currentQuorum.
    function quorum() public {
        uint q = multiplyPercentage(currentQuorum, 100, 500);
        uint n = multiplyPercentage(avgAbsStakePerVegaPeriod, 100, 125);
        currentQuorum = q + n;
    }

    ///@notice 'multiplyPercentage' is used to help with multiplication of a fraction.
    function multiplyPercentage(uint _value, uint _numerator, uint _denominator) public constant returns (uint) {
       uint value = (_value * _numerator) / _denominator;
       return value;
    }
}
