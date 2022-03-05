// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract UnderhandedNFT {
  uint256 bulkQty = 2;
  uint256 bulkDiscount = 0.1 ether;
  uint256 unitPrice = 1 ether;

  error InvalidPayment(uint256);

  function buy(uint256 qty) public payable {
      uint256 total = qty * (unitPrice - ((qty / bulkQty) * bulkDiscount));
      if (msg.value < total) revert InvalidPayment(total - msg.value);
  }
}
