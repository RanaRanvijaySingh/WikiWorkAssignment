import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/common/authenticator.dart';
import 'package:wiki_work_assignment/common/shared_preference_helper.dart';
import 'package:wiki_work_assignment/resources/colors.dart';
import 'package:wiki_work_assignment/resources/dimensions.dart';
import 'package:wiki_work_assignment/utils/validation_utils.dart';

import '../../resources/app_strings.dart';
import '../../routing/app_routes.gr.dart';
import '../custom_view/background.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String _username = "";
  String _password = "";
  bool _hidePassword = true;
  bool _isValidUsername = true;
  bool _isValidPassword = true;

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Stack(children: [
        CustomPaint(
          size: Size(720, (720 * 1.6666666666666667).toDouble()),
          painter: RPSCustomPainter(),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameInputView(),
              const SizedBox(height: AppDimensions.spaceSmall),
              _passwordInputView(),
              const SizedBox(height: AppDimensions.spaceMedium),
              _loginButtonView(AppStrings.login),
            ],
          ),
        ),
      ]),
    );
  }

  TextField _usernameInputView() {
    return TextField(
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(Icons.person, color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.inputFieldBorderRadius),
          ),
        ),
        hintText: AppStrings.usernameHint,
      ),
      textInputAction: TextInputAction.next,
      onChanged: (newText) {
        setState(() {
          _username = newText.trim();
          _isValidUsername = ValidationUtils.isValidUsername(_username);
        });
      },
    );
  }

  TextField _passwordInputView() {
    return TextField(
      obscureText: _hidePassword,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
        suffixIcon: IconButton(
          padding: const EdgeInsets.all(AppDimensions.spaceXSmall),
          icon: Icon(
              _hidePassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye,
              color: AppColors.primary),
          // icon: const Icon(Icons.remove_red_eye, color: AppColors.primary),
          onPressed: _onTapShowPassword,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.inputFieldBorderRadius),
          ),
        ),
        hintText: AppStrings.passwordHint,
      ),
      textInputAction: TextInputAction.done,
      onChanged: (newText) {
        setState(() {
          _password = newText;
          _isValidPassword = ValidationUtils.isValidPassword(_password);
        });
      },
    );
  }

  Widget _loginButtonView(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(AppDimensions.buttonWidth, AppDimensions.buttonHeight),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      onPressed: _onLoginClick,
      child: Text(buttonText,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: AppDimensions.fontSizeButton,
          )),
    );
  }

  _onTapShowPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  _onLoginClick() {
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_username.isEmpty) {
        showMessage(AppStrings.invalidUsername);
      } else if (_password.isEmpty) {
        showMessage(AppStrings.invalidPassword);
      } else {
        Authenticator().login(_username, _password).then((value) {
          if (value) {
            SharedPrefHelper().login();
            context.router.pushAndPopUntil(const HomeRoute(),
                predicate: (Route<dynamic> route) {
              return false;
            });
          } else {
            showMessage("Login failure");
          }
        });
      }
    });
  }

  void showMessage(String message) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
