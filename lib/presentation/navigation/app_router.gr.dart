// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AuthView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RootViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RootView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
        transitionsBuilder: fadeInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthViewRoute.name,
          path: 'login',
        ),
        RouteConfig(
          RootViewRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: RootViewRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeViewRoute.name,
              path: 'home',
              parent: RootViewRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [AuthView]
class AuthViewRoute extends PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: 'login',
        );

  static const String name = 'AuthViewRoute';
}

/// generated route for
/// [RootView]
class RootViewRoute extends PageRouteInfo<void> {
  const RootViewRoute({List<PageRouteInfo>? children})
      : super(
          RootViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootViewRoute';
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewRoute';
}
