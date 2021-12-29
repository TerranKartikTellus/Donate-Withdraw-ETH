// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet{
 uint public numOfFunders;    // default = 0
 mapping(address=>bool) private funders; 
 mapping(uint => address) private lutFunders; // look up table
 function addFunds() external payable {
   
      address funder = msg.sender;
      if( !funders[funder] ){
                uint index = numOfFunders++;
                funders[funder] = true;
                lutFunders[index] = funder;
      }
  }
 function getFundersAtIndex(uint index) external view returns(address){
    return lutFunders[index];
 }
 
 function getAllFunders() external view returns(address[] memory){
           address[] memory _funders = new address[](numOfFunders);
           for(uint i=0 ; i < numOfFunders ; i++){
                     _funders[i] = lutFunders[i];
           }
           return _funders;
 }

}


// preventing duplication of adding address in list of funders 

// truffle migrate --reset
// truffle console
// const instance = await Faucet.deployed()
// instance.addFunds({value: "202020202" , from: accounts[0]})
// instance.addFunds({value: "202020202" , from: accounts[1]})
// instance.getFundersAtIndex(0)
                    // > '0xA507185e878E238d9315a3DfDa4eC6d9CB739345'
// instance.getFundersAtIndex(1)
                    // > '0xA507185e878E238d9315a3DfDa4eC6d9CB739345'


// look under GANACHE Faucet contract 
          // numOfFunders = 2

// instance.getAllFunders()
// [
//   '0xA507185e878E238d9315a3DfDa4eC6d9CB739345',
//   '0xe4B63CF1c3DC35B097113993d658288FDd43FF30'
// ]

// 