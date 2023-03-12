// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract BankApp{
    mapping (address=>uint256) UserAccount; 
    mapping (address=>bool) UserExists;
    
    


    function deposit() public payable
    {
        UserAccount[msg.sender] = UserAccount[msg.sender] + msg.value;
    }


    function withdraw(uint256 withdrawAmount) public payable
    {
        
        require( (UserExists[msg.sender]==true) && (withdrawAmount <UserAccount[msg.sender]) );
        UserAccount[msg.sender] = UserAccount[msg.sender] - withdrawAmount;
        
    }

    function accountBalance() public view returns(uint256)
    {
        return UserAccount[msg.sender];
    }
}
