contract MockOracle {
    address public owner;
    uint256 public price; // Ex: preço do par BRL/TRY com 8 casas decimais

    constructor(uint256 initialPrice) {
        owner = msg.sender;
        price = initialPrice;
    }

    function setPrice(uint256 newPrice) external {
        require(msg.sender == owner, "Only owner can set price");
        price = newPrice;
    }

    function getPrice() external view returns (uint256) {
        return price;
    }
}