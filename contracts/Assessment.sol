// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 public balance;

    struct Item {
        string name;
        uint256 price;
        bool available;
    }

    Item[] public items;

    event showAddress(address walAddr);
    event Deposit(address indexed from, uint256 amount, uint256 timestamp);
    event Withdraw(address indexed to, uint256 amount, uint256 timestamp);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event ItemAdded(string name, uint256 price);
    event ItemBought(uint256 indexed itemId, address indexed buyer, uint256 timestamp);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner of this account");
        _;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function displayAddress() public payable {
        emit showAddress(owner);
    }

    function deposit(uint256 _amount) public payable onlyOwner {
        uint256 _previousBalance = balance;

        balance += _amount;

        assert(balance == _previousBalance + _amount);

        emit Deposit(msg.sender, _amount, block.timestamp);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public onlyOwner {
        uint256 _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        balance -= _withdrawAmount;

        assert(balance == (_previousBalance - _withdrawAmount));

        emit Withdraw(msg.sender, _withdrawAmount, block.timestamp);
    }

    function transferOwnership(address payable newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function addItem(string memory name, uint256 price) public onlyOwner {
        items.push(Item({
            name: name,
            price: price,
            available: true
        }));

        emit ItemAdded(name, price);
    }

    function buyItem(uint256 itemId) public payable {
        require(itemId < items.length, "Invalid item ID");
        Item storage item = items[itemId];
        require(item.available, "Item not available");
        require(balance >= item.price, "Insufficient funds to buy item");

        item.available = false;
        balance -= item.price;

        emit ItemBought(itemId, msg.sender, block.timestamp);
    }

    function getItemCount() public view returns (uint256) {
        return items.length;
    }

    function getItem(uint256 itemId) public view returns (string memory, uint256, bool) {
        require(itemId < items.length, "Invalid item ID");
        Item storage item = items[itemId];
        return (item.name, item.price, item.available);
    }
}

