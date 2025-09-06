# IMERSIVUS42 Project – BNB Testnet

## 📌 Contracts Deployed

* **Token (IMERSIVUS42Token)**

  * Name: `IMERSIVUS42 Token`
  * Symbol: `IMERSIVUS42`
  * Standard: ERC-20
  * Initial Supply: 21,000,000 IMERSIVUS42
  * **Address:** `0x37D1fD58Cd90e08D7D3F7b8C7aFD7d7EB03f49Fe`
  * [View on BscScan](https://testnet.bscscan.com/address/0x37D1fD58Cd90e08D7D3F7b8C7aFD7d7EB03f49Fe#code)

* **Oracle (MockOracle)**

  * Purpose: Provides simulated price feed (set manually by owner).
  * Initial Price: `100000000` (interpreted as 1.0 with 8 decimals).
  * **Address:** `0xCD13df8AfCEd2a2E6Cd860c9101b3284Eb0bA7A3`
  * [View on BscScan](https://testnet.bscscan.com/address/0xCD13df8AfCEd2a2E6Cd860c9101b3284Eb0bA7A3#code)

* **Exchange (FuturesExchange)**

  * Purpose: Simple futures market with deposits, open/close positions, and withdrawals using IMERSIVUS42Token.
  * Depends on: Token + Oracle addresses.
  * **Address:** `0x1F899A82f6d7235C72E779c8AcCEefD42bbd041c`
  * [View on BscScan](https://testnet.bscscan.com/address/0x1F899A82f6d7235C72E779c8AcCEefD42bbd041c#code)

---

## 🌐 Network

* **Blockchain:** BNB Smart Chain Testnet
* **Explorer Root:** [https://testnet.bscscan.com](https://testnet.bscscan.com)

---

## 🛠 How to Use

1. Add **IMERSIVUS42 token** to MetaMask using the **Token Address** above.
2. Approve spending of IMERSIVUS42 to the **Exchange** contract (`approve`).
3. Deposit tokens into the Exchange (`deposit`).
4. Open a long/short position (`openPosition(isLong, amount)`).
5. Update Oracle price with `setPrice` to simulate market movement.
6. Close the position (`closePosition`) to realize profit/loss.
7. Withdraw tokens back to your wallet (`withdraw`).

---

## 📖 Documentation

* **Whitepaper:** [documentation/whitepaper.md](documentation/whitepaper.md)
* Explains:

  * Project overview
  * Step-by-step usage
  * Security notes & limitations
  * Deployed addresses and references

---

## ⚙️ Development & Deployment

* **Compiler Version:** `v0.8.20+commit.a1b79de6`
* **EVM Version:** Shanghai
* **Optimizer:** Disabled (consistent with deployment)
* **Runs:** 200
* **Tooling:** Remix Ethereum IDE
* **Libraries:** OpenZeppelin Contracts

Deployment details can be found in [deployment/README.md](deployment/README.md).

---

## ✅ Checklist

* [x] All 3 contracts deployed on **BNB Smart Chain Testnet**
* [x] Source code verified on **BscScan** (see links above)
* [x] Token contains **“42”** in its name and **symbol IMERSIVUS42**
* [x] Documentation prepared (whitepaper, usage instructions)
* [x] Demonstration workflow reproducible: approve → deposit → open → setPrice → close → withdraw

---

🚀 **IMERSIVUS42** demonstrates a minimal futures exchange prototype, powered by a custom ERC-20 token, a mock oracle, and an exchange contract for educational purposes.
