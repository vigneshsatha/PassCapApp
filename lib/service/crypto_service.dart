import '../crypto/crypto_helper.dart';

class CryptoService {
  Future<String> encrypt(String value) {
    return CryptoHelper.cryptoHelper.encrypt(value);
  }

  Future<String> decrypt(String value) async {
    return await CryptoHelper.cryptoHelper.decrypt(value);
  }
}
