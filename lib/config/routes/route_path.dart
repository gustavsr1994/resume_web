import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_web/presentation/pages/work_page.dart';

import '../../presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'work',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const WorkPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          },
        ),
        GoRoute(
          path: 'work',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const WorkPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          },
        ),
      ],
    ),
  ],
);
