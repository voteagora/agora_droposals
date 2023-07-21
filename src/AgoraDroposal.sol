// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./ZoraNFTCreatorV1.sol";
import "./AgoraDroposalFactory.sol";

contract AgoraDroposal {
    ZoraNFTCreatorV1 public zoraNFTCreator;
    AgoraDroposalFactory public agoraDroposalFactory;

    IERC721Drop.SalesConfiguration public saleConfig;

    constructor(ZoraNFTCreatorV1 _zoraNFTCreator, AgoraDroposalFactory _agoraDroposalFactory, address payable _fundsRecipient) {
        zoraNFTCreator = _zoraNFTCreator;
        agoraDroposalFactory = _agoraDroposalFactory;

        // Define the sales configuration here
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
