const fs = require('fs');

const sha256 = require('js-sha256');

const Block = require('./block');

class Blockchain {
  constructor() {
    try {
      const blocks = JSON.parse(Buffer.from(fs.readFileSync('blockchain.json')).toString('utf8'));
      this.blocks = blocks;
    } catch (e) {
      this.blocks = [];
    }
  }

  getLatestBlock() {
    return this.blocks[this.blocks.length - 1];
  }

  async addBlock(data) {
    const prevBlock = this.getLatestBlock();

    const block = new Block(data);

    if (prevBlock) {
      block.index = prevBlock.index + 1;
      block.previousHash = prevBlock.hash;
    }

    block.hash = this.generateBlockHash(block);

    this.blocks.push(block);

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

  persistBlocks() {
    return fs.writeFileSync('blockchain.json', JSON.stringify(this.blocks), { flag: 'w+' });
  }
}

module.exports = Blockchain;
