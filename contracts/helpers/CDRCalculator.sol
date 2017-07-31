pragma solidity ^0.4.9;

import './Math.sol';

/// @title CDRCalculator
/// @description helper functions used to calculate CDR for voters

contract CDRCalculator {

    function tokenPositiveRewards(
        bool _support,
        uint _votes,
        uint _tokens,
        uint _totalTokens,
        uint _ROD,
        bool _outcome
        ) public constant returns (uint) {

        bool support = _support;
        uint votes = _votes;
        uint vM = voteMultiple(_tokens, _totalTokens);
        uint ROD = _ROD;
        bool outcome = _outcome;

        uint amount = votes * vM * ROD;

        if (support == true) {
            if (outcome == true) {
                return amount;
            } else {
                return 0;
            }
        } else if (support == false) {
            if (outcome == false) {
                return amount;
            } else {
                return 0;
            }
        }
    }

    function tokenNegativeRewards(
        bool _support,
        uint _votes,
        uint _tokens,
        uint _totalTokens,
        uint _ROD,
        bool _outcome
        ) public constant returns (uint) {

        bool support = _support;
        uint votes = _votes;
        uint vM = voteMultiple(_tokens, _totalTokens);
        uint ROD = _ROD;
        bool outcome = _outcome;

        uint amount = votes * vM * ROD;

        if (support == true) {
            if (outcome == true) {
                return 0;
            } else {
                return votes;
            }
        } else if (support == false) {
            if (outcome == false) {
                return 0;
            } else {
                return votes;
            }
        }
    }

    function sumTokenRewards(
        bool _support,
        uint _votes,
        uint _tokens,
        uint _totalTokens,
        uint _ROD,
        bool _outcome
        ) public constant returns (uint) {
            uint amount = tokenPositiveRewards(
                _support,
                _votes,
                _tokens,
                _totalTokens,
                _ROD,
                _outcome
                ) + tokenNegativeRewards(
                    _support,
                    _votes,
                    _tokens,
                    _totalTokens,
                    _ROD,
                    _outcome
                    );
            return amount;
        }

    function tokenPayoutPercentage(uint _newTokens, uint _rewards, uint _totalRewards) public constant returns (uint) {
        uint amount = multiplyPercentage(_newTokens, _rewards, _totalRewards);
        return amount;
    }
}
