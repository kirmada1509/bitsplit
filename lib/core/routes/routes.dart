import 'package:bitsplit/features/auth/presentation/pages/sign_in_page.dart';
import 'package:bitsplit/features/auth/presentation/pages/sign_up_page.dart';
import 'package:bitsplit/features/searching_users/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'sign-in',
      builder: (BuildContext context, GoRouterState state) {
        return SignInPage();
      },
    ),
    GoRoute(
      path: '/sign-up',
      name: 'sign-up',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpPage();
      },
    ),
    GoRoute(
      path: '/home-page',
      name: 'home-page',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
  ],
);
