import "../node_modules/minimetoken/contracts/MiniMeToken.sol";


contract VegaToken is MiniMeToken {

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