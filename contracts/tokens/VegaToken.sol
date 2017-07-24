import "../node_modules/minimetoken/contracts/MiniMeToken.sol";
import "../proposals/structural/Rewards.sol";
import "../proposals/structural/Quorum.sol";
import "../proposals/structural/Metric.sol";
import "../proposals/structural/FindersFee.sol";
import "../proposals/structural/CreatorsDeposit.sol";

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

    function updateRewards(address _address) public {
        Rewards reward = Rewards(_address);
        require(reward.isVotePassed());
        require(!reward.voteApplied());
        reward.applyVote();        
        event = reward.event();
        reporting = reward.reporting();
        vestingEvent = reward.vestingEvent();
        vesting = reward.vesting();
    }

    function updateQuorum(address _address){
        Quorum quorum = Quorum(_address);
        require(quorum.isVotePassed());
        require(!quorum.voteApplied());
        quorum.applyVote();        
        quorum = quorum.quorum();
    }
    
    function updateMetric(address _address){
        Metric metric = Metric(_address);
        require(metric.isVotePassed());
        require(!metric.voteApplied());
        metric.applyVote();        
        metric = metric.metric();
    }

    function updateFee(address _address){
        FindersFee fee = FindersFee(_address);
        require(fee.isVotePassed());
        require(!fee.voteApplied());
        fee.applyVote();        
        fee = fee.fee();
        multiple = fee.multiple();
    }

    function updateDeposit(address _address){
        CreatorsDeposit deposit = CreatorsDeposit(_address);
        require(deposit.isVotePassed());
        require(!deposit.voteApplied());
        deposit.applyVote();
        deposit = deposit.deposit();
    }            

}