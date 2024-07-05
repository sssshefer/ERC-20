// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IERC20.sol";

contract ERC20 is IERC20{
    address OWNER;
    string NAME;
    string SYMBOL;
    uint DECIMALS;
    uint totalTokens;
    mapping (address => uint) balances;
    mapping (address => mapping(address => uint)) allowances;
    
    constructor(
        string memory name,
        string memory symbol,
        uint  decimals,
        uint initialTokenSupply,
        address shop
       
         )
    {
            OWNER = msg.sender;
            NAME = name;
            SYMBOL = symbol;
            DECIMALS = decimals;
            mint(initialTokenSupply, shop);
    }

    modifier enoughTokens(address targetAddress, uint amount) {
        require (balanceOf(targetAddress) > amount, "Not enough tokens on your balance");
        _;
    }

    modifier onlyOwner(){
        require(msg.sender == OWNER, "You are not an owner");
        _;
    }
    function name() external view returns(string memory){
        return NAME;
    }

    function symbol() external view returns(string memory){
        return SYMBOL;
    }

    function decimals() external pure returns(uint){
        return DECIMALS;//1 token = 1 wei
    }

    function totalSupply() external view returns(uint){
        return totalTokens;
    }

    function balanceOf(address targetAddress) public view returns(uint){
        return balances[targetAddress];
    }

    function transfer (address to, uint amount) external enoughTokens(msg.sender, amount){
        _beforeTokenTransfer(msg.sender, to, amount);
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function checkAllowance (address owner,address  spender) external view returns(uint){
        return allowances[spender][owner];
    }

    function approve(address spender, uint amount) public{
        _approve(msg.sender, spender, amount);
    }

    function _approve (address sender,address spender, uint amount, ) internal virtual{
        allowances[msg.sender][spender] = amount;
        emit Approve(sender, spender, amount);
    }

    function transferFrom(address sender, address recepient, uint amount) public enoughTokens(sender, amount){
        _beforeTokenTransfer(sender, recepient, amount);
        // require(allowances[sender][recepient] >= amount, "check allowance!");
        allowances[sender][recepient] -= amount;

        balances[sender] -= amount;
        balances[recepient] += amount;
        emit Transfer(sender, recepient, amount);
    }

    function mint(uint amount, address to) public onlyOwner{
        _beforeTokenTransfer(address(0), to, amount);
        balances[to] += amount;
        totalTokens += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(address from, uint amount) public onlyOwner enoughTokens(from, amount){
        _beforeTokenTransfer(from, address(0), amount);
        balances(from) -= amount;
    }


    function _beforeTokenTransfer(
        address from, 
        address to, 
        uint amount
    ) internal virtual{}

}