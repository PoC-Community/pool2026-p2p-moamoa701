pragma solidity ^0.8.20;

interface ISmartContract {
  
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

    function getHalfAnswerOfLife() external view returns (uint256);

    function getPoCIsWhat() external view returns (string memory);

    function editMyCity(string calldata _newCity) external;

    function getMyFullName() external view returns (string memory);

    function completeHalfAnswerOfLife() external;

    function hashMyMessage(string calldata _message) external pure returns (bytes32);

    function getMyBalance() external view returns (uint256);
    
    function addToBalance() external payable;
    
    function withdrawFromBalance(uint256 _amount) external;

    function myInformations() external view returns (
        string memory firstName,
        string memory lastName,
        uint8 age,
        string memory city,
        string memory role
    );
}

contract SmartContract is ISmartContract {}
