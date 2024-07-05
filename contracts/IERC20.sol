// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20 {
      function name() external view  returns (string memory);
      function symbol() external view returns (string memory);
      function decimals() external view returns(uint);
      function totalSupply() external view returns(uint);
      function balanceOf(address _address) external view returns(uint);
      function transfer(address to, uint amount) external;
      function checkAllowance(address owner, address spender) external view returns(uint);
      function approve(address spender, uint amount) external;
      function transferFrom(address sender, address recepient, uint amount) external;
      event Transfer(address indexed from, address indexed to, uint amount);
      event Approve(address indexed ownner, address indexed to, uint amount);
      
}