pragma solidity ^0.4.9;

/*
/// @title Math
/// @description basic math functions
*/
contract Math {

    function percent(uint _numerator, uint _denominator, uint _precision) public constant returns(uint quotient) {
         // caution, check safe-to-multiply here
        uint numerator  = _numerator * 10 ** (_precision+1);
        // with rounding of last digit
        uint _quotient =  ((numerator / _denominator) + 5) / 10;
        return (_quotient);
    }

    function multiplyPercentage(uint _value, uint _numerator, uint _denominator) public constant returns (uint) {
        uint value = (_value * _numerator) / _denominator;
        return value;
    }

    function voteMultiple(uint _tokens, uint _totalTokens) public constant returns (uint) {
        uint prob = percent(_tokens, _totalTokens, 2);
        uint odds = percent(100, prob, 0);
        return odds;
    }
}
