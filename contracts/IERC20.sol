// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20 {
      function name() external view  returns (string memory);
      function symbol() external view returns (string memory);
      function decimals() external pure returns(uint);
      function totalSupply() external view returns(uint);
      function balanceOf(address _address) external view returns(uint);
      function transfer(address to, uint amount) external;
      function allowance(address owner, address spender) external view returns(uint);
}