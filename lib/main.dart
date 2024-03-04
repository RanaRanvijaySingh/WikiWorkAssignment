import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:get_it/get_it.dart';
import 'package:wiki_work_assignment/common/security.dart';
import 'package:wiki_work_assignment/di.dart';
import 'package:wiki_work_assignment/resources/app_strings.dart';
import 'package:wiki_work_assignment/routing/app_routes.dart';

import 'resources/app_themes.dart';

GetIt getIt = GetIt.instance;

void main() {
  DependencyInjection().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Hardcoding it for now, at actual project this could a randomly generated.
  final _appKey = "ahsgbvgfdrecghnhg564678hdgbfgh37";

  final _appRoute = AppRoutes();

  final s = Security();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Save the application key in keychain at the start of application.
    // This will later be used as key to encrypt and decrypt password which
    // will be saved in Shared Preference.
    FlutterKeychain.put(key: AppStrings.appKey, value: _appKey);

    return MaterialApp.router(
      routerConfig: _appRoute.config(),
      theme: AppTheme().baseTheme,
    );
  }
}
