// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:wiki_work_assignment/presentation/gallery/gallery_screen.dart'
    as _i1;
import 'package:wiki_work_assignment/presentation/home/home_screen.dart' as _i2;
import 'package:wiki_work_assignment/presentation/login/login_screen.dart'
    as _i3;
import 'package:wiki_work_assignment/presentation/on_boarding/on_boarding_screen.dart'
    as _i4;
import 'package:wiki_work_assignment/presentation/spalsh_screen/splash_screen.dart'
    as _i5;

abstract class $AppRoutes extends _i6.RootStackRouter {
  $AppRoutes({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    GalleryRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.GalleryScreen(
          key: args.key,
          albumId: args.albumId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnBoardingScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.GalleryScreen]
class GalleryRoute extends _i6.PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    _i7.Key? key,
    required int albumId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          GalleryRoute.name,
          args: GalleryRouteArgs(
            key: key,
            albumId: albumId,
          ),
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static const _i6.PageInfo<GalleryRouteArgs> page =
      _i6.PageInfo<GalleryRouteArgs>(name);
}

class GalleryRouteArgs {
  const GalleryRouteArgs({
    this.key,
    required this.albumId,
  });

  final _i7.Key? key;

  final int albumId;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, albumId: $albumId}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<LoginRouteArgs> page =
      _i6.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.OnBoardingScreen]
class OnBoardingRoute extends _i6.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
