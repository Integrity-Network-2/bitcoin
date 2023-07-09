Shared Libraries
================

## trustcoinconsensus

The purpose of this library is to make the verification functionality that is critical to Trustcoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `trustcoinconsensus.h` located in  `src/script/trustcoinconsensus.h`.

#### Version

`trustcoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`trustcoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `trustcoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/trustcoin/bips/blob/master/bip-0016.mediawiki)) subscripts
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/trustcoin/bips/blob/master/bip-0066.mediawiki)) compliance
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/trustcoin/bips/blob/master/bip-0147.mediawiki))
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/trustcoin/bips/blob/master/bip-0065.mediawiki))
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/trustcoin/bips/blob/master/bip-0112.mediawiki))
- `trustcoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/trustcoin/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `trustcoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `trustcoinconsensus_verify_script` for the verification status)*
- `trustcoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `trustcoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `trustcoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `trustcoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NTrustcoin](https://github.com/NicolasDorier/NTrustcoin/blob/master/NTrustcoin/Script.cs#L814) (.NET Bindings)
- [node-libtrustcoinconsensus](https://github.com/bitpay/node-libtrustcoinconsensus) (Node.js Bindings)
- [java-libtrustcoinconsensus](https://github.com/dexX7/java-libtrustcoinconsensus) (Java Bindings)
- [trustcoinconsensus-php](https://github.com/Bit-Wasp/trustcoinconsensus-php) (PHP Bindings)
