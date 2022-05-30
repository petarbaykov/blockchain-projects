class Block {
  constructor() {
    this.index = 0;
    this.previousHash = 0;
    this.hash = "";
    this.nonce = 0;
    this.data = "";
  }

  get key() {
    return this.data + this.previousHash;
  }
}

module.exports = Block;