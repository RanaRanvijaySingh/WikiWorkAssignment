import 'package:encrypt/encrypt.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

import '../resources/app_strings.dart';

class Security {
  static Security instance = Security._();

  Security._();

  factory Security() => instance;

  Future<String?> encrypt(String message) async {
    final encryptor = await _getEncrypter();
    final iv = IV.fromLength(16);
    final encrypted = encryptor?.encrypt(message, iv: iv);
    return encrypted?.base64;
  }

  Future<String?> decrypt(String encryptedMessage) async {
    final encryptor = await _getEncrypter();
    final iv = IV.fromLength(16);
    final message = encryptor?.decrypt64(encryptedMessage!, iv: iv);
    return message;
  }

  Future<Encrypter?> _getEncrypter() async {
    final appKey = await FlutterKeychain.get(key: AppStrings.appKey);
    if (appKey != null && appKey.isNotEmpty) {
      final key = Key.fromBase64(appKey);
      final encryptor = Encrypter(AES(key));
      return encryptor;
    } else {
      return null;
    }
  }
}
