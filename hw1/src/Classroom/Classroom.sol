// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    uint256 private code = 1000;

    function register() external returns (uint256) {
        if (code != 1000) return code;
        code = 123;
        return 1000;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if (IClassroomV2(msg.sender).isEnrolled()) return 123;
        else return 1000;
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // 7191 v.s. 3859
        if (gasleft() < 6875) return 123;
        else return 1000;
    }
}
