// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "./Token.sol";

contract dBank {

  Token private token; //assign Token contract to variable
  //add mappings
  mapping(address => uint) public etherBalanceOf;
  mapping(address => uint) public depositStart;
  mapping(address => bool) public isDeposited;
  //add events
  event Deposit(address indexed user, uint etherAmount, uint timeStart);
  event Withdraw(address indexed user, uint etherAmount, uint depositTime, uint interest);

  //pass as constructor argument deployed Token contract
  constructor(Token _token) public {
    token = _token;
  }

  function deposit() payable public {
    //check if msg.sender didn't already deposited funds
    //check if msg.value is >= than 0.01 ETH
    etherBalanceOf[msg.sender] = etherBalanceOf[msg.sender] + msg.value;
    depositStart[msg.sender] = depositStart[msg.sender] + block.timestamp;

    isDeposited[msg.sender] = true;
    emit Deposit(msg.sender, msg.value, block.timestamp);
  }

  function withdraw() public {
    //check if msg.sender deposit status is true
    require(isDeposited[msg.sender]==true, "Error, no previous deposit");
    //assign msg.sender ether deposit balance to variable for event

    //check user's hodl time
    uint depositTime = block.timestamp - depostStart[msg.sender];

    //calc interest per second
    //calc accrued interest

    //send eth to user
    msg.sender.transfer(etherBalanceOf[msg.sender]);
    //send interest in tokens to user

    //reset depositer data
    etherBalanceOf[msg.sender] = 0;

    //emit event
    emit Withdraw(msg.sender, userBalance, depositTime, interest);

  }

  function borrow() payable public {
    //check if collateral is >= than 0.01 ETH
    //check if user doesn't have active loan

    //add msg.value to ether collateral

    //calc tokens amount to mint, 50% of msg.value

    //mint&send tokens to user

    //activate borrower's loan status

    //emit event
  }

  function payOff() public {
    //check if loan is active
    //transfer tokens from user back to the contract

    //calc fee

    //send user's collateral minus fee

    //reset borrower's data

    //emit event
  }
}