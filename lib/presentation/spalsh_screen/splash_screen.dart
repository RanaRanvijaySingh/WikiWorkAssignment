import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wiki_work_assignment/common/shared_preference_helper.dart';
import 'package:wiki_work_assignment/resources/dimensions.dart';
import 'package:wiki_work_assignment/routing/app_routes.gr.dart';

import '../custom_view/background.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        SharedPrefHelper pref = SharedPrefHelper();
        pref.isOnBoarded().then((value) {
          if (value) {
            // user is onboarded check if user is logged in
            pref.isLoggedIn().then((value) {
              if (value) {
                // user is logged in
                context.router.pushAndPopUntil(const HomeRoute(),
                    predicate: (Route<dynamic> route) {
                  return false;
                });
              } else {
                // user is not logged in
                context.router.pushAndPopUntil(LoginRoute(),
                    predicate: (Route<dynamic> route) {
                  return false;
                });
              }
            });
          } else {
            context.router.pushAndPopUntil(const OnBoardingRoute(),
                predicate: (Route<dynamic> route) {
              return false;
            });
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomPaint(
          size: Size(720, (720 * 1.6666666666666667).toDouble()),
          painter: RPSCustomPainter(),
        ),
        const Center(
            child: Text(
          "WikiWork",
          style: TextStyle(fontSize: AppDimensions.textSizeXXXLarge),
        ))
      ]),
    );
  }
}
