 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/PoolToken.sol";

contract PoolTokenTest is Test {
    PoolToken public token;
    address public owner = address(0x1);
    address public user = address(0x2);
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function setUp() public {
        vm.prank(owner);
        token = new PoolToken(INITIAL_SUPPLY);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
    }

    function testOnlyOwnerCanMint() public {
        vm.prank(user); 
        vm.expectRevert(); 
        token.mint(user, 1000 ether);
    }
}