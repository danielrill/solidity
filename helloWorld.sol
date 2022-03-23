/// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract helloWorld {
    struct User {
        string name;
    }

    User[] users;

    function createUser(string memory _name) public {
        User memory usr = User(_name);
        users.push[usr];
    }

    function print(User memory usr) public pure returns (string) {
        for (uint16 i = 0; i < users.length; i++) {
            if (users[i] == usr) return "Hello World! my name is " + usr.name;
        }
        return "Hello World!";
    }
}
