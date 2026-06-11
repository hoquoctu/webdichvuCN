import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/services_screen.dart';
import '../screens/service_detail_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/news_screen.dart';
import '../screens/recruitments_screen.dart';
import '../screens/contact_screen.dart';
import '../widgets/header.dart';
import '../widgets/floating_cta.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(110), // 40px language top-nav + 70px main header
            child: AppHeader(),
          ),
          drawer: const AppMobileDrawer(),
          body: Stack(
            fit: StackFit.expand,
            children: [
              child,
              const Positioned(
                bottom: 24,
                right: 24,
                child: FloatingCTA(),
              ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/gioi-thieu', builder: (context, state) => const AboutScreen()),
        GoRoute(path: '/dich-vu', builder: (context, state) => const ServicesScreen()),
        GoRoute(path: '/dich-vu/:slug', builder: (context, state) => ServiceDetailScreen(slug: state.pathParameters['slug']!)),
        GoRoute(path: '/du-an', builder: (context, state) => const ProjectsScreen()),
        GoRoute(path: '/tin-tuc', builder: (context, state) => const NewsScreen()),
        GoRoute(path: '/tuyen-dung', builder: (context, state) => const RecruitmentsScreen()),
        GoRoute(path: '/lien-he', builder: (context, state) => const ContactScreen()),
      ],
    ),
  ],
);
