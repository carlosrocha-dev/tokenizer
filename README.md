# IMERSIVUS42 Project — BNB Smart Chain **Testnet**

> Projeto educacional (42 + BNB Chain) demonstrando um token **BEP-20 (ERC-20-compatible)**, um **oracle** simples e uma **mini-exchange** para abrir/fechar posições e calcular P/L.
> Rede: **BSC Testnet (ChainID 97)** — use **tBNB** do faucet para pagar gás.

---

## 📦 Contratos Implantados (Testnet)

### 1) Token — `IMERSIVUS42Token`

* **Name:**`IMERSIVUS42 Token`
* **Symbol:**`IMERSIVUS42`
* **Standard:****BEP-20 (ERC-20-compatible)**
* **Decimals:**`18`
* **Initial Supply (em tokens):**`21,000,000 IMERSIVUS42`
* **Initial Supply (on-chain / 18 casas):**`21000000 * 10^18`
* **Address:**`0x93783d7E8097cba710922e9997aA1759C34A4618`
  * Explorer: [https://testnet.bscscan.com/address/0x93783d7E8097cba710922e9997aA1759C34A4618]()

### 2) Oracle — `MockOracle`

* **Função:** feed de preço definido pelo **owner** (didático).
* **Escala recomendada:**`1e18` (ex.: 2,000.00 → `2000 * 1e18`)
* **Address:**`0xE769449D1Ed5d4F6E7e2DB220DEe01b22554b979`
  * Explorer: [https://testnet.bscscan.com/address/0xE769449D1Ed5d4F6E7e2DB220DEe01b22554b979]()

### 3) Exchange — `FuturesExchange`

* **Função:** depósito/saque, abertura/fechamento de posição e cálculo de P/L com base no oracle.
* **Depende de:** Token + Oracle.
* **Address:**`0xF38ca9Ef40cc666Adad33E983121c1bdFE81383D`
  * Explorer: [https://testnet.bscscan.com/address/0xF38ca9Ef40cc666Adad33E983121c1bdFE81383D]()

---

## 🌐 Rede

* **Blockchain:** BNB Smart Chain **Testnet** (ChainID **97**)
* **Moeda de gás:**`tBNB` (faucet)
* **Explorer:**[https://testnet.bscscan.com](https://testnet.bscscan.com?utm_source=chatgpt.com)

---

## ⚙️ Desenvolvimento & Deploy

* **IDE:** Remix (Injected Provider – MetaMask, BSC Testnet)
* **Compiler:**`Solidity 0.8.20`
* **EVM:** Shanghai
* **Optimizer:****Disabled** (consistente com o deploy) — *se habilitar, documente `runs`*
* **Libs:** OpenZeppelin Contracts

Arquivos de apoio em `deployment/` (passo a passo e verificação no explorer).
