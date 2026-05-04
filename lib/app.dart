import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/pages/_pages.dart';
import 'package:portfolio6/theme/_theme.dart';

class ArticleRoute extends GoRoute {
  ArticleRoute()
    : super(
        path: '/article/:id',
        name: 'article',
        builder: (_, GoRouterState state) {
          final String? articleId = state.pathParameters['id'];

          return InternalArticlePage(
            id: articleId,
          );
        },
      );

  static void go(BuildContext context, String articleId) {
    context.goNamed(
      'article',
      pathParameters: {
        'id': articleId,
      },
    );
  }
}

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
            path: '/dino',
            name: 'dino',
            builder: (_, _) => DinoPage(),
          ),
          GoRoute(
            path: '/articles',
            name: 'articles',
            builder: (_, _) => ArticlesPage(),
          ),
          ArticleRoute(),
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
            path: '/hackathons',
            name: 'hackathons',
            builder: (_, _) => HackathonsPage(),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            builder: (_, _) => ContactPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (_, _) {
      return PageNotFound();
    },
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
