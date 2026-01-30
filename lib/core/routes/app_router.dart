import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:on_the_go/features/main/ui/main_screen.dart';
import 'package:on_the_go/features/splash/ui/splash.dart';

class AppRouter {
  static const String splashPath = '/';
  static const String homePath = '/home';

  static final GoRouter router = GoRouter(
    initialLocation: splashPath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: splashPath,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: homePath,
        name: "home",
        builder: (context, state) => const MainScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
