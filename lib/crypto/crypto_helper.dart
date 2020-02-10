import 'package:encrypt/encrypt.dart';

import 'secure_storage_helper.dart';

class CryptoHelper {
  String saltKey = "SECRET_KEY";
  String secretIvKey = "IV_KEY";
  var keySecret;
  var ivSecret;
  static final CryptoHelper cryptoHelper = CryptoHelper._();
  SecureStorageHelper secureStorageHelper;
  CryptoHelper._(){
    this.secureStorageHelper = new SecureStorageHelper();
  }
  Future _resolveSalt() async {
    var keyData = await _getSaltFromStorage();
    var ivData = await _getIvFromStorage();
    if (keyData == null || ivData == null) {
      final key = Key.fromLength(32);
      final iv = IV.fromLength(16);

      this.secureStorageHelper.writeValue(this.saltKey, key.base64);
      this.secureStorageHelper.writeValue(this.secretIvKey, iv.base16);
      this.keySecret = key;
      this.ivSecret = iv;
    } else {
      this.ivSecret = IV.fromBase16(ivData);
      this.keySecret = Key.fromBase64(keyData);
    }
  }

  Future _getSaltFromStorage() async {
    return await this.secureStorageHelper.getValue(this.saltKey);
  }

  Future _getIvFromStorage() async {
    return await this.secureStorageHelper.getValue(this.secretIvKey);
  }

  _getSalt() async {
    if (this.keySecret == null || this.ivSecret == null) {
      await this._resolveSalt();
    }
  }

  Future<String> encrypt(String value) async {
    await this._getSalt();
    var encrypter = Encrypter(AES(this.keySecret));
    var encrypted = encrypter.encrypt(value, iv: this.ivSecret);
    return encrypted.base64;
  }

  decrypt(String value) async {
    await this._getSalt();
    var encrypter = Encrypter(AES(this.keySecret));
    final String decrypted =
        encrypter.decrypt(Encrypted.fromBase64(value), iv: this.ivSecret);
    return decrypted;
  }
}
