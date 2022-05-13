
const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('TokenMaker');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);

    const theBalance = await nftContract.balanceOf(nftContract.address,3)
    console.log("Contract number:", theBalance);


    txn = await nftContract.makeNFT()

    // Wait for it to be mined.
    await txn.wait()
    console.log("Contract executed");

};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();
