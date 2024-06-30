# Web3 ATM and Marketplace

This project is a decentralized application (dApp) that simulates an ATM and a simple marketplace on the Ethereum blockchain. The dApp allows the contract owner to manage funds, add items for sale, and allows to purchase items using Ethereum.

## Features

- Deposit and withdraw ETH (for contract owner)
- Add items for sale 
- Buy items with ETH 
- View balance and transaction history
- Display items for sale and purchase status

## Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)
- Hardhat (v2.7.0 or higher)
- MetaMask (browser extension)

## Installation

1. Clone the repository:

git clone https://github.com/NirbehKaur/SCM-Starter

After cloning the github, you will want to do the following to get the code running on your computer.

1. Inside the project directory, in the terminal type: npm i
2. Open two additional terminals in your VS code
3. In the second terminal type: npx hardhat node
4. In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
5. Back in the first terminal, type npm run dev to launch the front-end.

After this, the project will be running on your localhost. 
Typically at http://localhost:3000/

## Interacting with the dApp
# Connecting MetaMask
Install the MetaMask browser extension if you haven't already.

Connect MetaMask to the local network (localhost 8545).

Import an account using one of the private keys from the Hardhat local node.

## Using the dApp

Connect Wallet: Click the button to connect your MetaMask wallet.

Deposit ETH: Click the "Deposit 1 ETH" button to deposit 1 ETH into the contract.

Withdraw ETH: Click the "Withdraw 1 ETH" button to withdraw 1 ETH from the contract.

Buy Items: Click the "Buy" button next to an available item to purchase it.

View Balance and Transactions: The UI displays your current balance and transaction history.
