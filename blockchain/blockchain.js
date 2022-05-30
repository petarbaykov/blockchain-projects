const sha256 = require('js-sha256');

const Block = require('./block');

class Blockchain {
  constructor(genesisBlock) {
    this.blocks = [];
  }

  getPreviousBlock() {
    return this.blocks[this.blocks.length - 1];
  }

  addBlock(data) {
    const block = this.getNextBlock(data);

    this.blocks.push(block);

    return block;
  }

  getNextBlock(data) {
    const prevBlock = this.getPreviousBlock();
    const block = new Block(data);

    if (prevBlock) {
      block.index = prevBlock.index + 1;
      block.previousHash = prevBlock.hash;
    }

    block.hash = this.generateBlockHash(block);

    return block;
  }

  getBlockAtIndex(index) {
    return this.blocks[index];
  }

  getAllBlocks() {
    return this.blocks;
  }

  generateBlockHash(block) {
    return sha256(block.key);
  }
}

module.exports = Blockchain;
