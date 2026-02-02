// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SmartContract {
    uint256 public halfAnswerOfLife = 21;
    address public myEthereumContractAddress = address(this);
    address public myEthereumAddress = msg.sender;
    string public PoCIsWhat = "Poc is good, PoC is life.";

    bool internal _areYouABadPerson = false;

    int256 private _youAreACheater = -42;

    bytes32 public whoIsTheBest;
    mapping (string => uint256) public myGrades;
    string[5] public myPhoneNumber;
    enum roleEnum { STUDENT, TEACHER }

    struct informations {
        string firstName;
        string lastName;
        uint8 age;
        string city;
        string role;
    }

    informations public myInformations = informations({
        firstName: "Leon",
        lastName: "ZHOU",
        age: 19,
        city: "Paris",
        role:"Student"
    });
        
    function getHalfAnswerOfLife() public view returns (uint256) {
        return halfAnswerOfLife;
    }

    function _getMyEtherumContractAddress() internal view returns (address) {
        return myEthereumContractAddress;
    }

    function getPoCIsWhat() external view returns (string memory) {
        return PoCIsWhat;
    }

    function _setAreYouABadPerson (bool _value) internal {
        _setAreYouABadPerson = _value;
    }
}