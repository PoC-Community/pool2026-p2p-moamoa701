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
    mapping(string => uint256) public myGrades;
    string[5] public myPhoneNumber;
    enum roleEnum {
        STUDENT,
        TEACHER
    }

    struct informations {
        string firstName;
        string lastName;
        uint8 age;
        string city;
        string role;
    }

    informations public myInformations =
        informations({firstName: "Leon", lastName: "ZHOU", age: 19, city: "Paris", role: "Student"});

    function getHalfAnswerOfLife() public view returns (uint256) {
        return halfAnswerOfLife;
    }

    function _getMyEtherumContractAddress() internal view returns (address) {
        return myEthereumContractAddress;
    }

    function getPoCIsWhat() external view returns (string memory) {
        return PoCIsWhat;
    }

    function _setAreYouABadPerson(bool _value) internal {
        _areYouABadPerson = _value;
    }

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function completeHalfAnswerOfLife() public onlyOwner {
        halfAnswerOfLife = halfAnswerOfLife + 21;
    }

    function hashMyMessage(string calldata _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    mapping(address => uint256) public balances;

    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function addToBalance() public payable {
        balances[msg.sender] += msg.value;
        emit BalanceUpdated(msg.sender, balances[msg.sender]);

    }

    function withdrawFromBalance(uint256 _amount) public {
     
        if (balances[msg.sender] < _amount) {
            revert InsufficientBalance(balances[msg.sender], _amount);
        }
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Echec du transfert");
        emit BalanceUpdated(msg.sender, balances[msg.sender]);

    }
        event BalanceUpdated(address indexed user, uint256 newBalance);

        error InsufficientBalance(uint256 available, uint256 requested);
        
    
}
