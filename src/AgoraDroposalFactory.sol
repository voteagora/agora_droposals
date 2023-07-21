// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AgoraDroposalFactory {
    event PrepareEdition(
        string name,
        string symbol,
        uint64 editionSize,
        uint16 royaltyBPS,
        address defaultAdmin,
        string description,
        string animationURI,
        string imageURI
    );

    function prepareEdition(
        string memory name,
        string memory symbol,
        uint64 editionSize,
        uint16 royaltyBPS,
        address defaultAdmin,
        string memory description,
        string memory animationURI,
        string memory imageURI
    ) external {
        emit PrepareEdition(
            name,
            symbol,
            editionSize,
            royaltyBPS,
            defaultAdmin,
            description,
            animationURI,
            imageURI
        );
    }
}
