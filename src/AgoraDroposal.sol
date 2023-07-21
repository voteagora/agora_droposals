// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "../lib/zora-drops-contracts/src/ZoraNFTCreatorV1.sol";
import "./AgoraDroposalFactory.sol";

/* 
* @title AgoraDroposal
* @dev This contract is used to create an Agora Droposal Edition
* The Agora Droposal Edition is a Zora NFT Edition that is created using the Zora NFT Creator
*/

contract AgoraDroposal {
    ZoraNFTCreatorV1 public zoraNFTCreator;
    AgoraDroposalFactory public agoraDroposalFactory;

    IERC721Drop.SalesConfiguration public saleConfig;

    constructor(ZoraNFTCreatorV1 _zoraNFTCreator, AgoraDroposalFactory _agoraDroposalFactory, address payable _fundsRecipient) {
        zoraNFTCreator = _zoraNFTCreator;
        agoraDroposalFactory = _agoraDroposalFactory;

        // setup the sales configuration for the Zora NFT Creator
        saleConfig = IERC721Drop.SalesConfiguration({
            publicSalePrice: 1 ether,
            maxSalePurchasePerAddress: 1,
            publicSaleStart: block.timestamp + 1 days,
            publicSaleEnd: block.timestamp + 2 days,
            presaleStart: block.timestamp,
            presaleEnd: block.timestamp + 1 days,
            presaleMerkleRoot: bytes32(0)
        });
    }

    function createAgoraDroposalEdition() external {
        (string memory name, string memory symbol, uint64 editionSize, uint16 royaltyBPS, address defaultAdmin, string memory description, string memory animationURI, string memory imageURI) = agoraDroposalFactory.getInputs();

        zoraNFTCreator.createEdition(
            name,
            symbol,
            editionSize,
            royaltyBPS,
            _fundsRecipient,
            defaultAdmin,
            saleConfig,
            description,
            animationURI,
            imageURI
        );
    }
}
