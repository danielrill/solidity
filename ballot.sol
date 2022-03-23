/// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Ballot {
    struct Voter {
        uint256 weight;
        bool voted;
        uint8 vote;
        address delegate;
    }

    struct Proposal {
        uint256 voteCount;
    }

    address chairPerson;
    mapping(address => Voter) voters;
    Proposal[] proposals;

    /// Create a new ballot with $(_numProposals) different proposals
    function create_ballot(uint8 _numProposals) public view {
        chairPerson = msg.sender;
        voters[chairPerson].weight = 1;
        proposals.length = _numProposals;
    }

    /// Give &(voter) the right to vote on this ballot
    function giveRighttoVote(address voter) public {
        if (msg.sender != chairPerson || voters[voter].voted) return;
        voters[voter].weight = 1;
    }

    /// Delegate your vote to the voter
    function delegate(address to) public {
        Voter sender = voters[msg.sender];
        if (sender.voted) return;
        while (
            voters[to].delegate != address(0) &&
            voters[to].delegate != msg.sender
        ) to = voters[to].delegate;

        if (to == msg.sender) return;
        sender.voted = true;
        sender.delegate = to;
        Voter delegater = voters[to];

        if (delegate.voted) proposals[delegate.vote].voteCount += sender.weight;
        else delegate.weight += sender.weight;
    }

    function vote(uint8 proposal) public {
        Voter sender = voters[msg.sender];
        if (sender.voted || proposal >= proposals.length) return;
        sender.voted = true;
        sender.vote = proposal;
        proposals[proposal].voteCount += sender.weigth;
    }

    function winningProposal() constant returns (uint8 winningProposal) {
        uint256 winningVoteCount = 0;
        for (uint8 proposal = 0; proposal < proposals.length; proposal++)
            if (proposals[proposal].voteCount > winningVoteCount) {
                winningVoteCount = proposals[proposal].voteCount;
                winningProposal = proposal;
            }
    }
}
