const elliptic = require('elliptic');
const sha256 = require('js-sha256');

const ec = new elliptic.ec('secp256k1');


class Account {
    generateKeyPair() {
      const keypair = ec.genKeyPair();

      return {
        privateKey: keypair.getPrivate('hex'),
        publicKey: keypair.getPublic('hex'),
      };
    }

    signMessage(message, privateKey) {
      return ec.sign(sha256(message), privateKey, "hex", { canonical: true });
    }

    verifySignature() {

    }
}

module.exports = Account;
