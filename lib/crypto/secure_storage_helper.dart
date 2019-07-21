import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  FlutterSecureStorage storage;
  SecureStorageHelper() {
    this.storage = new FlutterSecureStorage();
  }

  Future getValue(String key) async {
    return await storage.read(key: key);
  }

  Future deleteValue(String key) async {
    return await storage.delete(key: key);
  }

  Future writeValue(String key, String value) async {
    return await storage.write(key: key, value: value);
  }
}
