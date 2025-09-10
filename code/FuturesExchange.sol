// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20Like {
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from,address to,uint256 value) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
}

interface IOracle {
    function getPrice() external view returns (uint256); // 1e18
}

contract FuturesExchange {
    IERC20Like public immutable token;
    IOracle   public immutable oracle;

    mapping(address => uint256) public balance; // saldo depositado no exchange

    struct Position {
        bool    open;
        int256  size;       // >0 long, <0 short (escala 1e18)
        uint256 entryPrice; // 1e18
    }
    mapping(address => Position) public positions;

    constructor(address token_, address oracle_) {
        token = IERC20Like(token_);
        oracle = IOracle(oracle_);
    }

    // ----- saldo -----
    function deposit(uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount), "transferFrom fail");
        balance[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(balance[msg.sender] >= amount, "insufficient");
        balance[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "transfer fail");
    }

    // ----- posições -----
    function openPosition(int256 size) external {
        require(!positions[msg.sender].open, "already open");
        require(size != 0, "size=0");
        uint256 px = oracle.getPrice();
        positions[msg.sender] = Position({
            open: true,
            size: size,
            entryPrice: px
        });
    }

    function closePosition() external {
        Position memory p = positions[msg.sender];
        require(p.open, "no position");
        uint256 px = oracle.getPrice();

        int256 pnl; // em unidades do token (1e18)
        if (p.size > 0) {
            // long: (px - entry) * size / 1e18
            pnl = (int256(px) - int256(p.entryPrice)) * p.size / int256(1e18);
        } else {
            // short: (entry - px) * |size| / 1e18
            pnl = (int256(p.entryPrice) - int256(px)) * (-p.size) / int256(1e18);
        }

        positions[msg.sender].open = false;
        positions[msg.sender].size = 0;
        positions[msg.sender].entryPrice = 0;

        if (pnl > 0) {
            balance[msg.sender] += uint256(pnl);
        } else if (pnl < 0) {
            uint256 loss = uint256(-pnl);
            require(balance[msg.sender] >= loss, "loss>balance");
            balance[msg.sender] -= loss;
        }
    }
}
