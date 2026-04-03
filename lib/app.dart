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
          GoRoute(
            path: '/work',
            name: 'work',
            builder: (_, _) => WorkPage(),
          ),
          GoRoute(
            path: '/projects',
            name: 'projects',
            builder: (_, _) => ProjectsPage(),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            builder: (_, _) => ContactPage(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      scrollBehavior: const GenScrollBehavior(),
      theme: const GenTheme().build(),
    );
  }
}
