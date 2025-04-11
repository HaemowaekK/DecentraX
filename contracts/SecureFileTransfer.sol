// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SecureFileTransfer {
    struct File {
        string cid;
        address owner;
        mapping(address => bool) accessList;
    }

    struct User {
        string role; // "Admin", "User"
        bool exists;
    }

    mapping(string => File) private files;
    mapping(address => User) private users;

    event FileStored(string cid, address owner);
    event AccessGranted(string cid, address grantedTo);
    event UserRegistered(address user, string role);

    modifier onlyAdmin() {
        require(
            keccak256(abi.encodePacked(users[msg.sender].role)) == keccak256(abi.encodePacked("Admin")),
            "Only Admins can perform this action"
        );
        _;
    }

    function registerUser(address _user, string memory _role) public onlyAdmin {
        users[_user] = User(_role, true);
        emit UserRegistered(_user, _role);
    }

    function storeFile(string memory _cid) public {
        require(users[msg.sender].exists, "User not registered");
        require(bytes(files[_cid].cid).length == 0, "File already exists");
        files[_cid].cid = _cid;
        files[_cid].owner = msg.sender;
        files[_cid].accessList[msg.sender] = true;

        emit FileStored(_cid, msg.sender);
    }

    function grantAccess(string memory _cid, address _recipient) public {
        require(bytes(files[_cid].cid).length != 0, "File does not exist");
        require(msg.sender == files[_cid].owner, "Only owner can grant access");
        files[_cid].accessList[_recipient] = true;

        emit AccessGranted(_cid, _recipient);
    }

    function getFile(string memory _cid) public view returns (string memory) {
        require(bytes(files[_cid].cid).length != 0, "File does not exist");
        require(files[_cid].accessList[msg.sender], "Access denied");
        return files[_cid].cid;
    }
}
