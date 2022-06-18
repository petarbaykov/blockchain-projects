class Block {
  constructor(data = "") {
    this.index = 0;
    this.previousHash = 0;
    this.hash = "";
    this.nonce = 0;
    this.data = data;
    this.timestamp = Date.now();
  }

  get key() {
    return this.data + this.previousHash;
  }
}

module.exports = Block;