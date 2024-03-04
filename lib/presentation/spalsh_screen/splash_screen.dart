import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/common/shared_preference_helper.dart';
import 'package:wiki_work_assignment/routing/app_routes.gr.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPrefHelper pref = SharedPrefHelper();
    pref.isOnBoarded().then((value) {
      if(value){
        // user is onboarded  jump to login screen
        context.router.push(LoginRoute());
      }else {
        context.router.push(const OnBoardingRoute());
      }
    });
    return const Scaffold(
      body: Center(child: Text("Splash")),
    );
  }
}
