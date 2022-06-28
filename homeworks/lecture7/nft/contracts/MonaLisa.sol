// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MonaLisa is ERC1155 {
    constructor() ERC1155("ipfs://dsadsadsadsadasdasdas") {
        // 1of1
        // _mint(msg.sender, 0, 1, "");

        // Fractional
        _mint(msg.sender, 0, 1000, "");
    }
}
