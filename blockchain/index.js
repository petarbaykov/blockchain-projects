const Blockchain = require('./blockchain');

const blockchain = new Blockchain();

blockchain.addBlock("This is the genesis block");
blockchain.addBlock("This is the second block");
blockchain.addBlock("This is the third block");