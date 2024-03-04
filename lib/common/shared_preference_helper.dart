import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiki_work_assignment/common/security.dart';

final class SharedPrefHelper {
  static SharedPrefHelper instance = SharedPrefHelper._();

  SharedPrefHelper._();

  factory SharedPrefHelper() => instance;
  final Security _security = Security();

  saveOnBoardingDetail(String username, String password) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // Encrypt password before saving it in shared preferences.
    /*await _security.encrypt(password).then((value) {
      // Save the it in shared preference once encrypted.
      pref.setString(SharedPrefKeys.password, value ?? "");
    });*/
    pref.setString(SharedPrefKeys.password, password);
    pref.setString(SharedPrefKeys.username, username);
    pref.setBool(SharedPrefKeys.isOnBoarded, true);
  }

  Future<String?> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(SharedPrefKeys.username);
  }

  Future<bool> isOnBoarded() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(SharedPrefKeys.isOnBoarded) ?? false;
  }

  Future<String?> getPassword() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(SharedPrefKeys.password);
    /*final encryptedPassword = pref.getString(SharedPrefKeys.password);
    if (encryptedPassword != null) {
      return _security.decrypt(encryptedPassword);
    }
    return null;*/
  }
}

final class SharedPrefKeys {
  static const username = "username";
  static const password = "password";
  static const isOnBoarded = "isOnBoarded";
  static const isLoggedIn = "isLoggedIn";
}
