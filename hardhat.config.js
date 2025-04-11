require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.19",
  networks: {
    amoy: {
      url: "https://rpc-amoy.polygon.technology",
      accounts: ["4dfda8813de8d7e8d880533f7d2993096fe0ae614d92553ebeb28dea37b74897"], // 🚨 Replace this with your private key
    },
  },
};
