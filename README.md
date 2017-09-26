# READ ME

This is the core repository for the Vega System. Currently this project is a work in progress.
In order to interact with the contracts you must either deploy them or import add into another project as a dependency.

The contracts provided should allow an individual to run a token creation event for the Vega Token, and then provides basic proposal structure.

The system is designed such that any contract address can be supplied for any proposal during creation. This means choices are not limited to the options provided here.


## General Architecture

### Basic Dependency Graph
```
                +--------+                   +---------+
                |Strategy+<------HasA--------+Financial|
                +----+---+                   +---+-----+
                     |                           |
      +------+       |                           |
      |Reward+<-HasA-+           +-----+         |          +----------+
      +------+                   |Other+---------+---+------+Structural|
                                 +-----+             |      +----+--+--+
                                                    IsA          ^  |
   +---------+                                       |           |  |
   |StakeVote+------+                                V           |  |
   +---------+      |            +----+           +--------+     |  |
                    +--+--IsA+--->Vote|      +--->+Proposal|     |  |
                    |  |         +----+      |    +--------+     |  |
+------------+      |  |                     |                   |  |
|StandardVote+------+  +--HasA------+--------+                   |  |
+------------+                      |                            |  |
                                    v                            |  |
  +------------+              +-----+---+                        |  |
  |TokenFactory+-----Mints--->+VegaToken+-----Validates+---------+  |
  +------------+              +--+------+                           |
         +-----------+           |   ^-------Updates----------------+
         |MiniMeToken+<---IsA----+
         +-----------+

```

### Control Flow
The token factory is used to handle the distribution of VegaToken which is a modified MiniMeToken. The actual VegaToken should have limited functions and mostly relies on the ability to add proposal types, and execute proposal types. In order for a proposal to be executed the vote attached to that proposal must pass. Multiple votes could hypothetically be attached to the same proposal, all that matters is that a vote has passed for that proposal. If a structural proposal is executed it affects with the way that Vega is structured and how proposals are executed(Quourum, CreatorsDeposit, FindersFee). If a financial proposal is executed it allocates funds to a Strategy which triggers a Reward. CDR is the first Reward type implemented and allocation is the first strategy implemented. All an allocation proposal will do is forward all funds to a given contract. For full details on CDR please see our white paper. It is also possible to create other proposal types that serve various other functions. The system is agnostic towards what proposal types are created; the primary security concerns are with Structural proposals as these are the ones that are capable of modifying the system itself. In the case of severe modifiction needs the abilities of the MiniMeToken can be leveraged.


## Vega Contracts
For more information on the basic types of Vega Contracts please see our technical specifications.

## Getting started
      git clone git@github.com:VegaProject/vega-contracts.git	
      cd vega-contracts				
      npm install			
      testrpc			// do this in new terminal
      npm run test	
