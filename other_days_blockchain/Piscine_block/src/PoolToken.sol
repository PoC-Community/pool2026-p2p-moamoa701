// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PoolToken is ERC20, ERC20Permit, Ownable {

    uint256 public constant INITIAL_SUPPLY = 1_000_000 * 10**18;


    constructor()
        ERC20("Pool Token", "POOL")
        ERC20Permit("Pool Token")
        Ownable(msg.sender) 
    {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

     
    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
    



    

  