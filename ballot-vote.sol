pragma solidity >= 0.7.0 < 0.9.0;

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
        uint vote;
        bool voted;
        uint weight;
    }

    struct Proposal {
        // you can use bytes instead of string because it saves on gas fees
        bytes32 name; // the name of each proposal
        uint voteCount; // number of accumulated votes
    }

    Proposal[] public proposals;

    mapping(address => Voter) public voters; // voters get address as a key and Voter for value

    address public chairperson;

    constructor(bytes32[] memory proposalNames) {
        // msg.sender = is a global variable that states the person who is currently connecting to the contract.
        chairperson = msg.sender;

        // add 1 to chairperson weight
        voters[chairperson].weight = 1;

        // add proposal names to smart contract upon deployment
        for(uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    // function to authenticate voters

    function giveRightToVote(address voter) public {
        require(msg.sender == chairperson,
                'Only the Chairperson can give access to vote');
        // require they haven't voted yet
        require(!voters[voter].voted,
        'The voter has already voted');
        require(voters[voter].weight == 0);
        voters[voter].weight == 1;
    }

    // function for voting

    // function for showing results
}