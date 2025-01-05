// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract ChristmasWishlist{
    // Code goes here.
    // State variables stored inside the blockchain declared at the contract level
    // Local variables declared inside a fuction
    // Global variable provide information about the blockchain and transcation.

    string public owner;
    uint public totalItem;
    bool public isPublic;

    string public wishlist;
    mapping (address=> string[]) public userWishlists;
    // Links users with their wishlist.
    // Allow users to add items.
    function addItem(string memory item)public{
        userWishlists[msg.sender].push(item);

    }

    // Allow users to see their wishlist.
    function getWishlist()public view returns(string[]memory){
        return userWishlists[msg.sender];

    }
    
    function toggleVisibility(bool status)public {
        //allow users to add a boolean variable
        isPublic=status;
    }

    // Function to remove a specific item from the caller's wish list
    // item is the name of the item to be removed
    // Function to remove a specific item from the caller's wish list
    // item is the name of the item to be removed
    function removeItem(address  item) public {

      require(item == msg.sender, "you can only remove on your wishlist");

       delete userWishlists[item];
    }

}