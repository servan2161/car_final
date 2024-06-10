import 'package:car_project_vize/core/device.dart';
import 'package:car_project_vize/screens/product/buyi5.dart';
import 'package:car_project_vize/services/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/client/login.dart';
import '../screens/client/profile.dart';
import '../screens/client/register.dart';
import '../screens/core/loader.dart';
import '../screens/home _deneme.dart';
import '../screens/home.dart';
import '../screens/product/bmw.dart';
import '../screens/product/product.dart';
import '../screens/product/search.dart';
import '../screens/static/about.dart';
import '../screens/static/boarding.dart';
import '../screens/static/contact.dart';
import '../screens/core/error.dart';
import '../widgets/page/bottom.dart';

// GoRouter configuration
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const error(),
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => DashboardScreen(
              state: state,
              child: child,
            ),
        routes: [
          GoRoute(
            path: '/device',
            builder: (context, state) => const device(),
            parentNavigatorKey: _shellNavigatorKey,
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const home(),
          ),
          GoRoute(
            path: '/buyi5',
            builder: (context, state) => const i5buy(),
          ),
          GoRoute(
            path: '/bmw',
            builder: (context, state) => const bmw(),
          ),
        ]),
    GoRoute(
      path: '/',
      builder: (context, state) => const loader(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const home(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const register(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const login(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const profile(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const product(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const search(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const about(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const contact(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const boarding(),
    ),
    GoRoute(
      path: '/home_deneme',
      builder: (context, state) => const home_deneme(),
    ),
    GoRoute(
      path: '/bottom',
      builder: (context, state) => const bottom(),
    ),
    GoRoute(
      path: '/device',
      builder: (context, state) => const device(),
    ),
  ],
);
