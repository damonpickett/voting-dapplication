pragma solidity >= 0.7.0 < 0.9.0

// making a voting contract

// 1. we want the ability to accept proposals and store them
// proposal: their name, number

// 2. voters and voting ability
// keep track of voting
// check voters are authenticated to vote

contract Ballot {
    // struct is a method to create your own data type

    // voters: voted, access to vote, vote index

    struct Voter {
        uint vote
        bool voted;
        uint weight;
    }

    struct Proposal {
        // you can use bytes instead of string because it saves on gas fees
        bytes32 name; // the name of each proposal
        uint voteCount; // number of accumulated votes
    }
}