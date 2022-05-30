const sha256 = require('js-sha256');

const Block = require('./block');

class Blockchain {
  constructor(genesisBlock) {
    this.blocks = [];
  }

  getPreviousBlock() {
    return this.blocks[this.blocks.length - 1];
  }

  // TODO: add block
  addBlock() {
    console.log('add block');
    const block = this.getNextBlock();


    this.blocks.push(block);


    console.log(block);
    return block;
  }

  getNextBlock() {
    const prevBlock = this.getPreviousBlock();

    const block = new Block();
    block.index = prevBlock.index + 1;
    block.previousHash = prevBlock.hash;
    block.hash = this.generateBlockHash(block);


    return block;
  }

  mine(difficulty = 0) {

  }

  // TODO: get block at index
  getBlockAtIndex(index) {
    console.log(this.blocks[index]);
    return this.blocks[index];
  }

  // TODO: get all blocks
  getAllBlocks() {
    console.log(this.blocks);
    return this.blocks;
  }

  generateBlockHash(block) {
    return sha256(block.key);
  }
}

module.exports = Blockchain;
