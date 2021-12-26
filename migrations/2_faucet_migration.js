
//give access tosmart contract byte code
const FaucetContract = artifacts.require("Faucet");

module.exports = function (deployer){
          deployer.deploy(FaucetContract)
}