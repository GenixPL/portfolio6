import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/pages/_pages.dart';
import 'package:portfolio6/theme/_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, _) => HomePage(),
        routes: [
          GoRoute(
            path: '/articles',
            name: 'articles',
            builder: (_, _) => ArticlesPage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      scrollBehavior: CustomScrollBehavior(),
      theme: const GenTheme().build(),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
