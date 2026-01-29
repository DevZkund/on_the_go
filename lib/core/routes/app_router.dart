import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const String homePath = '/';
  static const String homeName = 'home';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: homePath,
        name: homeName,
        builder: (context, state) => const HomePage(),
      ),
      // Add more routes here as the app grows
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
