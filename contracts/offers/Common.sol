pragma solidity ^0.4.8;
/**@title Common Offer */
contract Common is Ownable {

    bytes32 name;
    string description;
    uint duration;
    // 0 = pending, 1 = failed 
    uint8 state;
    mapping (address => bool) private votes;
    /**
    * @dev Main constructor for a Common offer
    * @param name A way to identify the title of the offer.
    * @param description Any string, and or an IPFS path, URL, etc.
    * @param duration Time the offer will be available for. Must be a minimum of ~7 days, and a maximum of ~30 days (calculated in block numbers)
    */
    function Common (
        bytes32 _name,
        string _description,
        uint _duration
    ) {
        name = _name;
        description = _description;
        duration = _duration;
    }

    /**
    * This contract should check and ensure that the duration of the
    * offer has not passed. If the duration for the contract has passed this contract
    * needs to inform the controlling contract.
    * alternatively we may consider using a contract like the ethereum alarm clock
    * @dev Basic method for casting a vote
    * @param inSupport True if voter supports the vote.
    */
    function vote(bool inSupport) {
        votes[msg.sender] = inSupport;
        // This function should alert the offers controller on a vote cast
        // This will allow for the controlling function to check if this offer can execute and
        // execute the offer as needed.
    }

    /**
    * This handles only whether or not the contract is capable of executing.
    * Since each offer will have a different behavior on execution 
    * @dev Asseses the state of the contract and returns true if the function can execute
    * @return returns true if the contract can execute and false if the contract cannot 
    */
    function canExecute() public constant returns (bool executable) {
        
    }


}