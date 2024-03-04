import 'package:wiki_work_assignment/data/models/ui_models/album_ui_model.dart';

class ValidationUtils {
  static bool isValidUsername(String username) {
    return username.isNotEmpty &&
        !username.contains(RegExp(r'[ ]')) &&
        username.length >= 8 &&
        username.length <= 35;
  }

  static bool isValidPassword(String password) {
    return password.isNotEmpty &&
        password.length >= 8 &&
        password.length <= 35 &&
        !password.contains(RegExp(r'[ ]')) &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static bool isValidList(List? list) {
    return list != null && list.isNotEmpty;
  }
}
