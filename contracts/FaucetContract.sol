// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet{

 address[] public funders; 
 function addFunds() external payable {
      funders.push(msg.sender);
  }
 function getFunders() public view returns(address[] memory){
      return funders;
  }
 
 function getFundersAtIndex(uint index) external view returns(address){
    address[] memory _funders = getFunders();
    return _funders[index];
 }
}

// add Funds to smart-contract from account 0 ,1,2,3
// show list of address of wallet of people who has funded us using  getFunders()
// remember to fire up ganache before u deploy smart contract.
// ensure truffle is installed using npm or yarn

// public function = function be called inside of the smart-contract also
// external function = function cannot be called inside of the smart-contract and can only be called from outside using truffle instance of smart-contract (const instance = await Faucet.deployed()) 
// u can use this.theExternalFunction() if there is an emence need to call a external function from withing the smart contract but this will increase the gas fee
// address[] = is a array type that store address of eth wallets
//           defined public 
//           "funders" is the array name

// getFunders() function
//        external = can be called in truffle console using smart-contract instance
//        view = indicate that we can viewdata
//        returns an array that will have address of wallet from "memory" of eth-network where smart-contract is placed


// funders.push(msg.sender); = each time addFunds function gets called , address of sender is pushed(appended) into "funder array";

// truffle migrate --reset
// truffle console
// const instance = await Faucet.deployed()

// instance.addFunds({ value: "292929292" , from: accounts[0] })
// instance.addFunds({ value: "292929292" , from: accounts[1] })
// instance.addFunds({ value: "292929292" , from: accounts[2] })
// instance.addFunds({ value: "292929292" , from: accounts[3] })
// instance.addFunds({ value: "292929292" , from: accounts[4] })
// instance.addFunds({ value: "292929292" , from: accounts[5] })

// instance.getFunders();
          // [
          //   '0xA507185e878E238d9315a3DfDa4eC6d9CB739345',
          //   '0xe4B63CF1c3DC35B097113993d658288FDd43FF30',
          //   '0xB358DF1732f9AcCd3B84323953204F597e9272B3'
          // ]
// instance.getFundersAtIndex(0);
// '0xA507185e878E238d9315a3DfDa4eC6d9CB739345'
// here wai worth "292929292" is sent from account 0,1,2,3,4 in GANACHE(test net) to smart-contract, 

// where we are saving address of sender each time we recieve a fund

// add Funds to smart-contract from account 0 ,1,2,3
// show list of address of wallet of people who has funded us using  getFunders()
