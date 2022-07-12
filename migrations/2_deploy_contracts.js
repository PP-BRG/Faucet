const Faucet = artifacts.require('Faucet')

module.exports = async function (deployer, network, accounts) {
    console.log('Network: ', network)
    console.log('Accounts: ', accounts)
    await deployer.deploy(Faucet, '0xbf1305AD2ddeECa0B453B4CE792DE25b091b99A0', accounts[0])
    await Faucet.deployed()
    console.log('Faucet Deployed Successed!')
}