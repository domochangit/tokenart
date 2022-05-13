//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract TokenMaker is ERC1155 {
    string private greeting;

    uint256 public constant HAPPY_MAN = 0;
    uint256 public constant NIRVANA = 1;

    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        console.log("Deploying a Greeter with greeting:");
        greeting = "greeting";


    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;
    }


    function makeNFT() public {

        console.log("makeNFT");
        _mint(msg.sender, HAPPY_MAN, 10**3, "TKH_HAPPY_MAN");
        _mint(msg.sender, NIRVANA, 1, "TKH_NIRVANA");

        console.log(
            "1000 HAPPY_MAN NFT with ID %s have been minted to %s",
            HAPPY_MAN,
            msg.sender
        );

        console.log(
            "A NIRVANA NFT with ID %s has been minted to %s",
            NIRVANA,
            msg.sender
        );

        console.log("makeNFT finished");
    }
}
