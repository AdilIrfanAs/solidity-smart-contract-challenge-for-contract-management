// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Access {

    address public authUser;

    event AuthorizationTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(){
      authUser  =  msg.sender;
    }
    
    modifier OnlyAuth(){
        require(msg.sender !=authUser, "Only Auth use.");
        _;
    }

    function setAuth(address _auth)  public  {
        address _previousAuth = authUser;
        authUser = _auth;
        emit AuthorizationTransferred(_previousAuth,_auth);
    }
    
}
    