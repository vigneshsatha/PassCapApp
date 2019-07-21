import '../crypto/crypto_helper.dart';

class CryptoService {
  Future<String> encrypt(String value) {
    return CryptoHelper.cryptoHelper.encrypt(value);
  }

  String decrypt(String value) {
    return CryptoHelper.cryptoHelper.decrypt(value);
  }
}
