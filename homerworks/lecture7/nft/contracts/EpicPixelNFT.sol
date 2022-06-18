// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract EpicPixelNFT is ERC721, Ownable {
    uint256 public constant MAX_SUPPLY = 1000;
    uint256 public constant MINT_PRICE = 0.01 ether;

    uint256 public totalSupply = 0;
    bool public revealed = false;
    string public baseURI;

    error InsufficientValue();
    error MaxSupplyReached();
    error InvalidAmount();
    error NotRevealed();
    error FailedWithdrawal();

    constructor(string memory _unrevealedURI) ERC721("My Collection", "MCL") {
        baseURI = _unrevealedURI;
    }

    function mint(uint256 _amount) public payable {
        if (msg.value < MINT_PRICE * _amount) {
            revert InsufficientValue();
        }
        if (_amount == 0) {
            revert InvalidAmount();
        }
        if (totalSupply + _amount > MAX_SUPPLY) {
            revert MaxSupplyReached();
        }
        uint256 supply = totalSupply;
        for (uint256 i = 1; i <= _amount; i++) {
            _safeMint(msg.sender, supply + i);
        }
        totalSupply += _amount;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        string memory uri = baseURI;
        if (!revealed) {
            return uri;
        }
        return
            bytes(uri).length > 0
                ? string(
                    abi.encodePacked(uri, Strings.toString(tokenId), ".json")
                )
                : "";
    }

    function reveal() external onlyOwner {
        revealed = true;
    }

    function setBaseURI(string memory _newBaseURI) external onlyOwner {
        if (!revealed) {
            revert NotRevealed();
        }
        baseURI = _newBaseURI;
    }

    function withdrawEth() external onlyOwner {
        (bool sent, ) = payable(owner()).call{value: address(this).balance}("");
        if (!sent) {
            revert FailedWithdrawal();
        }
    }
}
