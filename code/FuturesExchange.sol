interface IOracle {
    function getPrice() external view returns (uint256);
}

interface IIMERSIVUS42Token {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract FuturesExchange {
    struct Position {
        bool isOpen;
        bool isLong;
        uint256 amount;
        uint256 entryPrice;
    }

    address public owner;
    IIMERSIVUS42Token public nomadToken;
    IOracle public oracle;
    mapping(address => Position) public positions;
    mapping(address => uint256) public balances;

    uint256 public constant MARGIN_DISCOUNT = 80;

    constructor(address tokenAddr, address oracleAddr) {
        owner = msg.sender;
        nomadToken = IIMERSIVUS42Token(tokenAddr);
        oracle = IOracle(oracleAddr);
    }

    function deposit(uint256 amount) external {
        require(nomadToken.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[msg.sender] += amount;
    }

    function openPosition(bool isLong, uint256 amount) external {
        require(!positions[msg.sender].isOpen, "Already has open position");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        uint256 effectiveMargin = amount * MARGIN_DISCOUNT / 100;
        uint256 price = oracle.getPrice();

        balances[msg.sender] -= amount;
        positions[msg.sender] = Position(true, isLong, effectiveMargin, price);
    }

    function closePosition() external {
        Position storage pos = positions[msg.sender];
        require(pos.isOpen, "No open position");

        uint256 currentPrice = oracle.getPrice();
        uint256 pnl;

        if (pos.isLong) {
            pnl = (currentPrice > pos.entryPrice) ?
                pos.amount * (currentPrice - pos.entryPrice) / pos.entryPrice :
                0;
        } else {
            pnl = (currentPrice < pos.entryPrice) ?
                pos.amount * (pos.entryPrice - currentPrice) / pos.entryPrice :
                0;
        }

        balances[msg.sender] += pos.amount + pnl;
        delete positions[msg.sender];
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        require(nomadToken.transfer(msg.sender, amount), "Transfer failed");
    }
}

