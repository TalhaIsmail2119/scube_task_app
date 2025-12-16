import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:scube_task_app/features/log_in/log_in_screen.dart';
import '../../features/data_scm/screens/scm_data_screen.dart';
import '../keys/navigators_keys.dart';
import 'app_routes.dart';


final appRoute = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      name: AppRoutes.dashboard,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        child: const DashboardScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.data_scm,
      name: AppRoutes.data_scm,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        child: ScmScreen(),
      ),
    ),



  ],
);

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
    transitionsBuilder: (c, animation, a2, child) => FadeTransition(
      opacity: animation.drive(_curveTween),
      child: child,
    ),
  );

  static final _curveTween = CurveTween(curve: Curves.easeIn);
}
