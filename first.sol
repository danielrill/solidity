/// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract aContract {
    /// Variables and Structs
    /// Modifiers
    /// Events
    /// Function declarations
    uint256 public item1;
    uint256 public item2;
    address public owner;

    function getItem1() public view returns (uint256) {
        return item1;
    }

    function getBothItems() public view returns (uint256, uint256) {
        return (item1, item2);
    }

    function withdraw() public payable {
        /// Logic to send coins to a user
    }

    function verifySignature(
        bytes memory data,
        bytes32 signature,
        address signer
    ) public pure virtual returns (bool);

    uint256[] balance = [10];

    /// bal variable is discarded when function completes
    function memoryBalance() public returns (uint256) {
        uint256[] memory bal = balance; /// Copy the value
        bal[0] = bal[0] + 1;
        return balance[0]; /// returns 10 as storage is not updated
    }

    function storageBalance() public returns (uint256) {
        uint256[] storage bal = balance;
        bal[0] = bal[0] + 1;
        return balance[0]; /// returns 11 as storage is updated
    }

    /// Create Update and delete Arrays
    address[] public whitelist; /// Dynamic array

    function updateWhitelist(address _user) public {
        whitelist.push(_user);
    }

    function deleteWhitelist() public {
        delete whitelist;
    }

    function fixedSizeArray(
        address _users1,
        address _users2,
        uint256 _k
    ) public {
        address[2] memory users;
        users[0] = _users1;
        users[1] = _users2;

        address[] memory usersAgain = new address[](_k);
        usersAgain[0] = _users1;
        usersAgain[1] = _users2;
    }

    /// Mappings
    mapping(address => uint256) public __balance;

    function getBalance(address _user) public view returns (uint256) {
        return __balance[_user];
    }

    function updateBalance(address _user, uint256 _balance) public {
        __balance[_user] = _balance;
    }

    /// create and store an enum

    enum Flag {
        ON,
        OFF
    }
    Flag public flag;

    function turnOn() public {
        flag = Flag.ON;
    }

    function turnOff() public {
        flag = Flag.OFF;
    }

    struct Player {
        address addr;
        uint256 attack;
        uint256 defense;
        uint256 magic;
        string tagline;
    }

    Player[] characters;

    function newCharacter(address _addr, string memory _tagline) public {
        /// Creating a new Instance Player()
        Player memory character = Player(_addr, 0, 0, 0, _tagline);
        characters.push(character);
    }

    function getTagline(address _addr) public view returns (string memory) {
        for (uint256 i = 0; i < characters.length; i++)
            if (characters[i].addr == _addr) {
                return characters[i].tagline;
            }
        return "";
    }

    /// Create an Event (Data published to the world)
    /// activated during execution with keyword emit
    event Move(address Player, uint256 choice);

    function playersChoice(uint256 _choice) public {
        emit Move(msg.sender, _choice);
    }

    /// Simple If function
    function LargestNumber(uint256 _a, uint256 _b)
        public
        pure
        returns (uint256)
    {
        if (_a > _b) {
            return (_a);
        } else {
            return (_b);
        }
    }

    /// While and for loops
    function isWhitelistForLoop(address _user) public view returns (bool) {
        for (uint256 i = 0; i < whitelist.length; i++) {
            if (whitelist[i] == _user) return TRUE;
        }
        return FALSE;
    }

    function inWhitelistDoWhile(address _user) public view returns (bool) {
        uint256 i = 0;
        do {
            if (whitelist[i] == _user) return TRUE;
            i = i + 1;
        } while (i < whitelist.length);
        return FALSE;
    }
}
