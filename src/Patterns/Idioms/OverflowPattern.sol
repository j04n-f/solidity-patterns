// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

library SafeMath8 {
    error OverflowError();

    function add(uint8 a, uint8 b) internal pure returns (uint8) {
        uint8 c;
        // Required for Solidity >8.0.0 to disable overflow checks
        unchecked {
            c = a + b;
        }
        require(c >= a, "Addition Overflow");
        return c;
    }
}

contract Overflow {
    using SafeMath8 for uint8;

    function runOverflowLoop() public pure {
        for (uint8 i = 255; i < 300; i.add(1)) {}
    }

    function runLoop() public pure {
        for (uint8 i = 255; i < 255; i.add(1)) {}
    }
}
