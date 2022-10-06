// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StepUpToken is ERC20 {
    constructor(uint256 _total) ERC20("StepUp", "SU") {
        _mint(msg.sender, _total * 10**18);
    }
}
