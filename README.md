# Agora Droposal Factory (ADF)

``` js
const Web3 = require('web3');

// Connect to the network (Here, let's connect to the Rinkeby test network)
let web3 = new Web3('ALCHEMY_CONFIGURED_URL');

// Set up the UserInputInterface contract instance
let agoraDroposalFactoryAbi = [...] 
let agoraDroposalFactoryAddress = "0x00000000000000000000000000";
let agoraDroposalFactoryContract = new web3.eth.Contract(agoraDroposalFactoryAbi, agoraDroposalFactoryAddress);

// Set up the EditionCreator contract instance
let agoraDroposalAbi = [...]
let agoraDroposalAddress = "0x00000000000000000000000000";
let agoraDroposalContract = new web3.eth.Contract(agoraDroposalAbi, agoraDroposalAddress);

// The account that's calling the function
let account = "0xYourAccount";

// The inputs from the form
let name = "My NFT";
let symbol = "MNFT";
let editionSize = 500;
let royaltyBPS = 100; // 1%
let defaultAdmin = "0xAdminAccount";
let description = "This is my NFT";
let animationURI = "https://mirror.xyz/animation";
let imageURI = "https://mirror.xyz/image";

// Call the userInput function in agoraDroposalFactory
agoraDroposalFactoryContract.methods.prepareEdition(name, symbol, editionSize, royaltyBPS, defaultAdmin, description, animationURI, imageURI)
.send({ from: account })
.on('receipt', function(receipt){
    console.log("User input receipt: ", receipt);
    
    // After the agoraDroposalFactory transaction is successful, call the createMyEdition function in EditionCreator to create the edition from the Zora contract
    editionCreatorContract.methods.createMyEdition()
    .send({ from: account })
    .on('receipt', function(receipt){
        console.log("Edition creation receipt: ", receipt);
    })
    .on('error', console.error);
    
})
.on('error', console.error);

```