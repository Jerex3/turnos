import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {

  static const TOKEN_KEY = "token";
  static const USER_CRED_KEY = "user_credential";

  static Future save(String key, String objectToSave) async {

    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: objectToSave);

  }

   static Future<String?> read(String key) async {
    
    const storage = FlutterSecureStorage();

    return await storage.read(key: key);

  }


}