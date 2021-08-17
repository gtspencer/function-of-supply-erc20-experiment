// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract OneToken is ERC20 {
  constructor() ERC20("One Token", "ONE") {
    _mint(msg.sender, 1 * 10 ** decimals());
  }

  function decimals() public pure override returns (uint8) {
    return 76;
  }
}