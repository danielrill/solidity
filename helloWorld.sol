/// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract helloWorld {
    struct User {
        string name;
    }

    User[] users;

    function createUser(string memory _name) public  {
        User memory usr = User(_name);
        users.push(usr);
    }
    
    function printName(User memory usr) public pure returns(string memory) {
        return string(abi.encodePacked("Hello World my name is", usr.name ));
    }        
    
}
