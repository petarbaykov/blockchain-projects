const Blockchain = require('./blockchain');
const Block = require('./block');

const genesisBlock = new Block();
const blockchain = new Blockchain();

blockchain.addBlock(genesisBlock);


console.log(blockchain);