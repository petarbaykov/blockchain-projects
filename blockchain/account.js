const elliptic = require('elliptic');
const sha256 = require('js-sha256');

const ec = new elliptic.ec('secp256k1');


class Account {
    generateKeyPair() {
      const keypair = ec.genKeyPair();

      const pubKey = keypair.getPublic();

      return {
        privateKey: keypair.getPrivate('hex'),
        publicKey: pubKey,
        publicKeyCompressed: pubKey.encodeCompressed("hex"),
      };
    }

    signMessage(message, privateKey) {
      return ec.sign(sha256(message), privateKey, "hex", { canonical: true });
    }

    verifySignature(message, signature, pubKey) {
      return ec.verify(sha256(message), signature, pubKey);
    }
}

module.exports = Account;
