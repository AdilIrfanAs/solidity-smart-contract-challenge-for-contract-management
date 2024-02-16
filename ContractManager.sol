// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Access.sol";

contract Manager is Access {    

    struct Store {
        address user;
        string descrition;
    }

    mapping(address => Store) private entriesStore;

    function create(address _userAddress,string memory _descrition) public OnlyAuth() {
        Store storage _store = entriesStore[_userAddress];
        require(bytes(_descrition).length > 0, "Description cannot be empty.");
        require(bytes(_store.descrition).length > 0 && _store.user == _userAddress, "Address already exists.");
        _store.user =  _userAddress;
        _store.descrition =  _descrition;

    }
    
    function update(address _userAddress,string memory _descrition) public OnlyAuth() {
        Store storage _store = entriesStore[_userAddress];
        require(bytes(_descrition).length > 0, "Description cannot be empty.");
        require(_store.user == _userAddress, "Only Authicate user update.");
        _store.user =  _userAddress;
        _store.descrition =  _descrition;
    }

    function remove(address _userAddress) public OnlyAuth() {
        Store storage _store = entriesStore[_userAddress];
        require(_store.user == _userAddress, "Only Authicate user delete/");
        delete entriesStore[_userAddress];
    }
}