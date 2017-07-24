import "../node_modules/minimetoken/contracts/MiniMeToken.sol";


contract VegaToken is MiniMeToken {

    uint public event;
    uint public  reporting;
    uint public  vestingEvent;
    uint public  vesting;
    uint public quorum;
    bytes32 public  metric;
    uint public  fee;
    uint public  multiple;
    uint public  deposit;


    function VegaToken(

    ) MiniMeToken(
        address _tokenFactory,
        address _parentToken,
        uint _parentSnapShotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) {

    }

}