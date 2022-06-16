const Faucet = artifacts.require('Faucet')

module.exports = async function (deployer, network, accounts) {
    console.log('network: ', network)
    console.log('accounts: ', accounts)
    await deployer.deploy(Faucet, '0x411614948A21987670F5D3f67bdb5f7FB74F2501', accounts[0])
    const faucet = await Faucet.deployed()
}