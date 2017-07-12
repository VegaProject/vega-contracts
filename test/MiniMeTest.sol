pragma solidity ^0.4.2;


import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MiniMetaCoin.sol";

contract MiniMeTest {
  function testInitialBalanceUsingDeployedContract() {
    MiniMetaCoin meta = MiniMetaCoin(DeployedAddresses.MiniMetaCoin());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() {
    MiniMetaCoin meta = new MiniMetaCoin();

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }
}