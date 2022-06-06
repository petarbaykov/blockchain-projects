const Blockchain = require('./blockchain');
const Account = require('./account');

const blockchain = new Blockchain();

blockchain.addBlock("This is the genesis block");
blockchain.addBlock("This is the second block");
blockchain.addBlock("This is the third block");


const account = new Account();

const keypair = account.generateKeyPair();

console.log('keypair', keypair);

const signature = account.signMessage("test", keypair.privateKey);

const validSignature = account.verifySignature("test", signature, keypair.publicKey);

console.log('valid signature', validSignature);