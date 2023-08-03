// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public tokenName;
    string public tokenSymbol;
    uint8 public tokenDecimals;
    uint256 public tokenTotalSupply;
    address public contractOwner;

    mapping(address => uint256) public balance;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier onlyOwner {
        require(msg.sender == contractOwner, "Only the contract owner can execute this function");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenDecimals = _decimals;
        tokenTotalSupply = _initialSupply * 10**uint256(_decimals);
        contractOwner = msg.sender;
        balance[contractOwner] = tokenTotalSupply;
    }

    function transfer(address _to, uint256 _value) external {
        require(_to != address(0), "Invalid recipient address");
        require(balance[msg.sender] >= _value, "Insufficient balance");

        balance[msg.sender] -= _value;
        balance[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }

    function approve(address _spender, uint256 _value) external {
        require(_spender != address(0), "Invalid spender address");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) external {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(balance[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");

        balance[_from] -= _value;
        balance[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
    }

    function mint(address _to, uint256 _value) external onlyOwner {
        require(_to != address(0), "Invalid recipient address");
        require(_value > 0, "Mint amount must be greater than zero");

        tokenTotalSupply += _value;
        balance[_to] += _value;

        emit Mint(_to, _value);
    }

    function burn(uint256 _value) external {
        require(balance[msg.sender] >= _value, "Insufficient balance");
        require(_value > 0, "Burn amount must be greater than zero");

        tokenTotalSupply -= _value;
        balance[msg.sender] -= _value;

        emit Burn(msg.sender, _value);
    }

}
