import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:template/presentation/screens/auth/auth_view.dart';
import 'package:template/presentation/screens/home/home_view.dart';
import 'package:template/presentation/screens/news/news_view.dart';
import 'package:template/presentation/screens/products/products_view.dart';
import 'package:template/presentation/screens/root/root_view.dart';

import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'View,Route,Widget',
  transitionsBuilder: fadeInTransition,
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthView,
      name: 'AuthViewRoute',
      path: 'login',
    ),
    AutoRoute(
      page: RootView,
      path: '/',
      initial: true,
      guards: [AuthGuard],
      children: <AutoRoute>[
        AutoRoute(
          page: HomeView,
          path: 'home',
          initial: true,
          children: [
            AutoRoute(
              page: ProductsView,
              path: 'products',
              initial: true,
            ),
            AutoRoute(
              page: NewsView,
              path: 'news',
            ),
          ]
        )
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}

Widget fadeInTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(
      opacity: animation,
      child: child,
    );
