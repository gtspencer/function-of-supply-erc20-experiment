// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MovingDecimals is ERC20 {
    uint8 currentDecimals;
  constructor() ERC20("Moving Decimals", "MOVE") {
    currentDecimals = 1;
    _mint(msg.sender, 10 * 10 ** decimals());
  }

  function decimals() public view override returns (uint8) {
    return currentDecimals;
  }
  
  function increaseDecimals() public {
      if (currentDecimals < 76)
        currentDecimals = currentDecimals + 1;
  }
  
  function transfer(address recipient, uint256 amount) public override returns (bool) {
      bool result = super.transfer(recipient, amount);
      increaseDecimals();
      return result;
  }
}