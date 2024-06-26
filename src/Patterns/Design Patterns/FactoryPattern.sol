// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract TokenTemplate {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = 18;
        totalSupply = _initialSupply * 10 ** uint256(decimals);
    }
}

contract Factory {
    address[] public tokens;

    function createToken(string memory _name, string memory _symbol, uint256 _initialSupply) external {
        address newToken = address(new TokenTemplate(_name, _symbol, _initialSupply));
        tokens.push(newToken);
    }

    function getTokens() external view returns (address[] memory) {
        return tokens;
    }
}
