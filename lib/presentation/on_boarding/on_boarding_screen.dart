import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/routing/app_routes.gr.dart';
import 'package:wiki_work_assignment/resources/colors.dart';
import 'package:wiki_work_assignment/resources/dimensions.dart';
import 'package:wiki_work_assignment/common/shared_preference_helper.dart';
import 'package:wiki_work_assignment/utils/Constants.dart';
import 'package:wiki_work_assignment/utils/validation_utils.dart';

import '../../resources/app_strings.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingScreen> {
  String _username = "";
  String _password = "";
  bool _hidePassword = true;
  bool _isValidUsername = true;
  bool _isValidPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _usernameView(),
          _passwordView(),
          _saveButtonView(AppStrings.save),
        ],
      ),
    );
  }

  Widget _usernameView() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spaceMedium),
      child: Column(
        children: [
          _usernameInputView(),
          const SizedBox(height: AppDimensions.spaceXXSmall),
          _suggestionUsername(),
        ],
      ),
    );
  }

  TextField _usernameInputView() {
    return TextField(
      maxLength: Constants.usernameLength,
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

  Widget _passwordView() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spaceMedium),
      child: Column(
        children: [
          _passwordInputView(),
          const SizedBox(height: AppDimensions.spaceXXSmall),
          _suggestionPassword(),
        ],
      ),
    );
  }

  TextField _passwordInputView() {
    return TextField(
      obscureText: _hidePassword,
      maxLength: Constants.passwordLength,
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

  Widget _suggestionUsername() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppStrings.usernameSuggestion,
        style: TextStyle(
            fontSize: AppDimensions.textSizeSmall,
            color:
                _isValidUsername ? AppColors.textSecondary : AppColors.error),
      ),
    );
  }

  Widget _suggestionPassword() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppStrings.passwordSuggestion,
        style: TextStyle(
            fontSize: AppDimensions.textSizeSmall,
            color:
                _isValidPassword ? AppColors.textSecondary : AppColors.error),
      ),
    );
  }

  Widget _saveButtonView(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(AppDimensions.buttonWidth, AppDimensions.buttonHeight),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      onPressed: _onSaveClick,
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

  _onSaveClick() {
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      _isValidPassword = ValidationUtils.isValidPassword(_password);
      _isValidUsername = ValidationUtils.isValidUsername(_username);
      if (_isValidUsername && _isValidPassword) {
        // Save the username in shared preference.
        SharedPrefHelper().saveOnBoardingDetail(_username, _password);
        context.router.push(LoginRoute());
      }
    });
  }
}
