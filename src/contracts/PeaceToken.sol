// pragma solidity ^0.5.16;

// contract PeaceToken {
//     // string name public = "Peace Token";

//     uint256 public totalSupply; // The total supply of PeaceTokens

//     string public name = "Peace Token";
//     string public symbol = "PEACE";
//     string public standard = "Peace Token v1.0";

//     mapping(address => uint256) public balanceOf;
//     mapping(address => mapping(address => uint256)) public allowance;

//     event Transfer(address indexed _from, address indexed _to, uint256 _value);
//     event Approval(
//         address indexed _owner,
//         address indexed _spender,
//         uint256 _value
//     );

//     // Constructor
//     constructor(uint256 _initialSupply) public {
//         totalSupply = _initialSupply;
//         balanceOf[msg.sender] = _initialSupply;
//     }

//     // Transfer Function

//     function transfer(address _receiver, uint256 _amount)
//         public
//         returns (bool sufficient)
//     {
//         if (balanceOf[msg.sender] < _amount) return false;
//         balanceOf[msg.sender] -= _amount;
//         balanceOf[_receiver] += _amount;

//         // Transfer Event
//         emit Transfer(msg.sender, _receiver, _amount);

//         // Return Boolean Value
//         return true;
//     }

//     function getBalance(address addr) public view returns (uint256) {
//         return balanceOf[addr];
//     }

//     // Function to approce delegated transfer

//     function approve(address _spender, uint256 _value)
//         public
//         returns (bool success)
//     {
//         allowance[msg.sender][_spender] = _value;

//         emit Approval(msg.sender, _spender, _value);

//         return true;
//     }

//     function transferFrom(
//         address _from,
//         address _to,
//         uint256 _value
//     ) public returns (bool success) {
//         require(_value <= balanceOf[_from]);
//         require(_value <= allowance[_from][msg.sender]);

//         balanceOf[_from] -= _value;
//         balanceOf[_to] += _value;

//         allowance[_from][msg.sender] -= _value;

//         emit Transfer(_from, _to, _value);

//         return true;
//     }
// }

pragma solidity ^0.5.16;

contract PeaceToken {
    string public name = "Peace Token";

    string public symbol = "PEACE";
    string public standard = "Peace Token v1.0";
    uint256 public totalSupply;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // Constructor
    constructor(uint256 _initialSupply) public {
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
}
