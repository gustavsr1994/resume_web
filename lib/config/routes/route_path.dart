import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_web/presentation/pages/education_page.dart';

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
          path: 'education',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const EducationPage(),
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
