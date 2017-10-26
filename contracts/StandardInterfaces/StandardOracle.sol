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

/// @title StandardOracle
/// @author George K. Van Hoomissen
/// @dev This is the StandardOracle interface for Vega.
/// If the proposal.oracle contract does not meet this standard,
/// then Vega will default to it's decentralized oracle.

contract StandardOracle {
    uint public startingValue;
    uint public currentValue;
    function updateCurrentValue() returns (bool success);
    event UpdateCurrentValue();
}
