// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StepUpTokenSale {
    address public owner;
    IERC20 public token;
    uint256 public constant pricePerEth = 100;

    event TokenSale(address indexed buyer, uint256 indexed saleCount);
    event TokenSaleFailed(address indexed buyer, uint256 indexed saleCount);

    constructor(address _owner, address _token) {
        owner = _owner;
        token = IERC20(_token);
    }

    function buyTokens() external payable {
        require(msg.value > 0, "No Ether sent");

        uint256 saleCount = msg.value * pricePerEth;

        // try token.transferFrom(owner, msg.sender, saleCount) {
        //     emit TokenSale(msg.sender, saleCount);
        // } catch {
        //     emit TokenSaleFailed(msg.sender, saleCount);
        // }

        require(
            token.transferFrom(owner, msg.sender, saleCount),
            "Trasfer Failed"
        );
        emit TokenSale(msg.sender, saleCount);
    }
}
