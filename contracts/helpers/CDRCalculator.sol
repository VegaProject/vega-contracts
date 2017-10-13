pragma solidity ^0.4.15;

/*
* @title CDRCalculator
* @description helper functions used to calculate CDR for voters
* @notes When pure keyword is supported all functions are pure,
*        when libraries are expanded this would be a good candidate.
*        for now the additional complexity of linking doesn't outweigh the ease of
*        an inheritance based approach
*/

contract CDRCalculator {


    uint constant ROD_PRECISION = 4;
    uint constant CVPGR_PRECISION = 4;

    /*
    * Used to get the ROD or return on decision based on the original and current values
    *
    * Thought of AS A PERCENT the rod value has 2 significant digits in it's "fractional part" ie %100.00 = 10000
    * @param _currentValue The current value of the decision or proposal
    * @param _startingValue The initial value of the decision or proposal
    */
    function returnOnDecision(int _currentValue, int _startingValue) public constant returns (int rod) {
        rod = preciseDiv(_currentValue, _startingValue, ROD_PRECISION);
    }

    /*
    * Gets the compound vega period growth rate or CVPGR for a given rod and period
    *
    * @param _rod the return on decision
    * @param _vegaPeriods the current number of vega periods that have passed for this proposal
    */
    function returnCVPGR(int _rod, uint _vegaPeriods) public constant returns (int cVPGR) {
        // Aboluste value versions of signed values
        uint absROD = _rod > 0 ? uint(_rod) : uint(-_rod);
        uint absCVPGR;
        // in order to get 6 significant digits we need to add 10^_vegaPeriods
        // for each significantdigit we want
        uint sigDigAdj = (10**(CVPGR_PRECISION*_vegaPeriods)) / (10**(ROD_PRECISION));
        absCVPGR = rootFinder( _vegaPeriods, absROD * sigDigAdj ) - 10 ** CVPGR_PRECISION;
        // This is only in the rare case that a proposal actually
        // ends up having a negative value. Currently this should not happen
        // as a basic allocation can only lose the allocated value
        // and has no implicated liabilities as somthing like
        // real-estate may.
        // More work on the actual formula workings must be handled for this case.
        cVPGR = int(absCVPGR);
        if ( _rod < 0) {
            cVPGR = int(-absCVPGR);
        }
    }

    /*
    * Used to calculate a reward given a stake
    *
    * @param _stake  The individuals stake in the proposal
    * @param _cVPGR The current cVPGR for the proposal
    */
    function reward(int _stake, int _cVPGR) public constant returns (int rewardV) {
        rewardV = (_stake / 10000) * _cVPGR;
    }

    /*
    * Calculates the token payout given the rewards as well as total rewards and the conversion rates
    *
    * @param _rewards The individual rewards
    * @param _absTotalRewards The total rewards
    * @param _tokenConversion The current rate of token conversion for this vega period
    */
    function tokens(int _rewards, uint _absTotalRewards, uint _tokenConversion) public constant returns (int tokenAdjustment) {
        tokenAdjustment = _rewards * int(_tokenConversion / 10000) / int(_absTotalRewards / 10000);
    }

    /*
    * Basic precise division method
    *
    * @param _numerator the numerator
    * @param _denominator the denominator
    * @param _percision the minimum total precision for the returned quotient
    * @notes Changes may need to be made depending on whether floor ceil or rounding are prefered
    */
    function preciseDiv(int _numerator, int _denominator, uint _precision) public constant returns(int quotient) {
        int fPointLocation = int (10 ** (_precision));
        int numerator = _numerator * fPointLocation;
        quotient = ((numerator / _denominator));
    }

    /*
    * find the nth root of a ie 4th root of 81 is int3
    * This formula always approximates DOWN, in order to round UP return x
    *
    * @param degree The degree for which nth root is calculated ie  2^degree for square root
    * @param base the base number for which nth root is calculated ie base^2 for square root
    */
    function rootFinder(uint degree, uint base) internal constant returns (uint y) {
            uint x = 1;
            y = rootStep(degree,base,x);
        do {
            x = y;
            y = rootStep(degree,base,x);
        }while(y < x);
    }

    /*
    * Basic helper for the rootFinder function
    *
    * @param degree The degree for which nth root is calculated ie  2^degree for square root
    * @param base the base number for which nth root is calculated ie base^2 for square root
    * @param x the current guess to work off of
    */
    function rootStep(uint degree, uint base, uint x) internal constant returns (uint) {
        return ((degree-1)*x + base/x**(degree-1))/degree;
    }

    /*
    * Calulator to update balance of depositor for a given proposal
    *
    * @param _balance The current balance of the voters tokens in the Deposited state
    * @param _currentValue The current value of the decision or proposal
    * @param _startingValue The starting value of the decision or proposal
    * @param _stake The stake used to vote in the proposal
    * @param _vegaPeriods The number of Vega Periods passed from the time the proposal was Approved or Denied
    * @param _absTotalRewards The absolute value of all rewards in the given Vega Period
    * @param _tokenConversion The current rate of token conversion for this vega period
    */

    function updateBalance(int _balance, int _currentValue, int _startingValue, int _stake, uint _vegaPeriods, uint _absTotalRewards, uint _tokenConversion) public constant returns (int) {
        int rod = returnOnDecision(_currentValue, _startingValue);
        int cvpgr = returnCVPGR(rod, _vegaPeriods);
        int rwd = reward(_stake, cvpgr);
        int num = tokens(rwd, _absTotalRewards, _tokenConversion);
        int balance = _balance + num;
        return balance;
    }

}
