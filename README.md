# ![logo-no-background](https://github.com/sssshefer/erc-20/assets/63253440/03cb43e9-d02a-453f-8740-9a60add8ff90)

# Shef token. ERC20 Implementation 

The Shef token Project is a simple implementation of an ERC20 token using Solidity

## Table of Contents
- [Introduction](#introduction)
- [Theory Notes](#theory-notes)
  - [ERC20 Standard](#erc20-standard)
  - [Hardhat](#hardhat)
- [Features and Functionality](#features-and-functionality)
- [Implementation](#implementation)
  - [Smart Contracts](#smart-contracts)
  - [Tests](#tests)
- [Running the Project Locally](#running-the-project-locally)
- [Deployment](#deployment)
- [Usage](#usage)
- [License](#license)

## Introduction
The project includes a smart contract for the token (ShefToken) and a shop (ShefShop) that allows users to buy and sell tokens. The smart contract is built with security and best practices in mind, including ownership checks and balance validations

## Theory Notes

### ERC20 Standard
ERC20 is a standard for tokens on the Ethereum blockchain. It defines a set of functions that all compliant tokens must implement, ensuring interoperability between various tokens and platforms

### Hardhat
Hardhat is a development environment to compile, deploy, test, and debug your Ethereum software. It helps developers manage and automate the recurring tasks that are part of the smart contract development workflow

## Features and Functionality
- **Token Creation**: The ShefToken smart contract allows for the creation and management of a new ERC20 token
- **Minting and Burning**: The contract owner can mint new tokens and burn existing ones
- **Transfers and Allowances**: Users can transfer tokens to others and set allowances for spending
- **Shop Integration**: The ShefShop contract allows users to buy tokens with Ether and sell tokens for Ether

## Implementation

### Smart Contracts
The project includes two main contracts:
1. **ERC20**: Implements the standard ERC20 functions and additional features like minting and burning.
2. **ShefShop**: Facilitates the buying and selling of ShefTokens.

### Tests
The project includes a suite of tests to ensure the functionality and security of the contracts. The tests cover scenarios such as:
- Deploying the contracts
- Buying and selling tokens
- Checking balances and allowances
- Minting and burning tokens

## Running the Project Locally
To run the project locally, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/sssshefer/ERC20.git
    cd sheftoken
    ```

2. **Install dependencies**:
    ```sh
    npm install
    ```

3. **Compile the contracts**:
    ```sh
    npx hardhat compile
    ```

4. **Run the tests**:
    ```sh
    npx hardhat test
    ```

5. **Deploy the contracts locally**:
    ```sh
    npx hardhat run scripts/deploy.js --network localhost
    ```

## Deployment
To deploy the contracts to a live network, follow these steps:

1. **Configure network settings** in `hardhat.config.js`.
2. **Deploy the contracts**:
    ```sh
    npx hardhat run scripts/deploy.js --network your-network
    ```

## Usage
Once deployed, you can interact with the ShefToken and ShefShop contracts using a web3 interface like Ethers.js or Web3.js. Ensure you have the ABI and contract addresses

## License
This project is licensed under the MIT License.
