# Faucet

> 阅读文档前，请先确保拥有可用的 VPN 代理

> 文档内容皆在测试网络中进行，涉及的加密货币没有实际价值，仅用于学习研究

> 请妥善保管助记词，保护好个人资产

## 获取代币

1. 创建并设置 MetaMask 钱包
    > [创建指引](https://myterablock.medium.com/how-to-create-or-import-a-metamask-wallet-a551fc2f5a6b)

2. 切换到 `Ropsten` 测试网络
    > [切换指引](https://autofarm.gitbook.io/autofarm-network/how-tos/defi-beginners-guide/switching-networks-on-metamask)

3. 前往 [Ropsten 测试网水龙头](https://faucet.egorfine.com/) 获取 `Ropsten` 测试网络下的 ETH
    > 用于支付 [Gas](https://ethereum.org/zh/developers/docs/gas/)

4. 导入代币 `0xea276261Ba2b3F46C720dcaAc2641507Ff205E82`
    > [导入指引](https://metamask.zendesk.com/hc/en-us/articles/360015489031-How-to-add-unlisted-tokens-custom-tokens-in-MetaMask)

5. 前往 [代币水龙头](https://pp-brg.github.io/faucet/) 获取代币 
    > 等待交易完成打包，你的钱包中将会出现代币


## 开发

### 目录结构

```
├── README.md
├── client                          // DApp
│   ├── README.md
│   ├── package-lock.json
│   ├── package.json
│   ├── public
│   │   └── index.html
│   └── src
│       ├── ABI
│       │   └── faucet.json         // 编译后的合约二进制接口与合约地址
│       ├── App.css
│       ├── App.js
│       ├── getWeb3.js              // 与以太坊建立连接
│       ├── index.css
│       └── index.js
├── contracts                       // 合约
│   ├── Faucet.sol
│   └── Migrations.sol
├── migrations                      // 部署指令
│   ├── 1_initial_migration.js
│   └── 2_deploy_contracts.js
└── truffle-config.js               // Truffle 配置
```
### 实现流程
1. 安装 [Truffle](https://trufflesuite.com/docs/truffle/getting-started/installation/)

2. 实现 Faucet 合约 [Faucet.sol](truffle/faucet/contracts/Faucet.sol)

    ...