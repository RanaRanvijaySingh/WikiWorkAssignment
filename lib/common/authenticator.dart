import 'dart:developer';

import 'package:wiki_work_assignment/common/shared_preference_helper.dart';

class Authenticator {
  Authenticator._();

  static final instance = Authenticator._();

  factory Authenticator() => instance;

  Future<bool> login(String username, String password) async {
    final pref = SharedPrefHelper();
    final pass = await pref.getPassword();
    final un = await pref.getUsername();
    log("comparing $password with $pass");
    log("comparing $username with $un");
    return username == un && pass == password;
  }
}
