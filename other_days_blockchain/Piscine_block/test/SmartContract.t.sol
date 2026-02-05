// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SmartContract.sol";

contract SmartContractHelper is SmartContract {
    function getAreYouABadPerson() public view returns (bool) {
        return _areYouABadPerson;
    }
}

contract SmartContractTest is Test {
    SmartContractHelper public myContract;

    function setUp() public {
        myContract = new SmartContractHelper();
    }

    function test_GetHalfAnswerOfLife() public {
        uint256 expected = 21;
        uint256 actual = myContract.getHalfAnswerOfLife();

        assertEq(actual, expected);
    }

    function test_AreYouABadPerson() public {
        bool isBad = myContract.getAreYouABadPerson();

        assertEq(isBad, false, "Should default to false");
    }
    function test_StructData() public {}

    function editMyCity(string calldata _newCity) public {
        myInformations.city = _newCity;
    }

    function getMyFullName() public view returns (string memory) {
        return string(abi.encodePacked(myInformations.firstName, " ", myInformations.lastName));
    }
}
