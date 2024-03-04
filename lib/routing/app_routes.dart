import 'package:auto_route/auto_route.dart';

import 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRoutes extends $AppRoutes {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnBoardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: GalleryRoute.page),
      ];
}
