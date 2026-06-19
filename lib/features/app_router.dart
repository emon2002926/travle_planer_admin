import 'package:go_router/go_router.dart';

import 'admin_shell.dart';
import 'administrator/views/administrators_screen.dart';
import 'auth/views/check_email_screen.dart';
import 'auth/views/dashboard_screen.dart';
import 'auth/views/forget_password_screen.dart';
import 'auth/views/login_screen.dart';
import 'auth/views/password_updated_screen.dart';
import 'auth/views/payment_screen.dart';
import 'auth/views/set_new_password_screen.dart';
import 'auth/views/settings_screen.dart';
import 'auth/views/user_management_screen.dart';



import 'package:get/get.dart';


class AppRoutes {
  static const login = '/login';
  static const forgotPassword = '/forgot-password';
  static const verify = '/verify';
  static const resetPassword = '/reset-password';
  static const resetSuccess = '/reset-success';

  static const dashboard = '/dashboard';
  static const users = '/users';
  static const payment = '/payment';
  static const administrators = '/administrators';
  static const settings = '/settings';
}

final GoRouter appRouter = GoRouter(
  // Share GetX's navigator so Get.dialog / Get.back / Get.snackbar work.
  navigatorKey: Get.key,
  initialLocation: AppRoutes.login,

  // TODO: real auth guard. Uncomment and wire to your auth state:
  // redirect: (context, state) {
  //   final loggedIn = AuthService.isLoggedIn;
  //   final atAuthScreen = const [
  //     AppRoutes.login, AppRoutes.forgotPassword, AppRoutes.verify,
  //     AppRoutes.resetPassword, AppRoutes.resetSuccess,
  //   ].contains(state.matchedLocation);
  //   if (!loggedIn && !atAuthScreen) return AppRoutes.login;
  //   if (loggedIn && state.matchedLocation == AppRoutes.login) return AppRoutes.dashboard;
  //   return null;
  // },

  routes: [
    GoRoute(path: AppRoutes.login, builder: (_, _) => LoginScreen()),
    GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (_, _) => ForgetPasswordScreen()),
    GoRoute(path: AppRoutes.verify, builder: (_, _) => CheckEmailScreen()),
    GoRoute(
        path: AppRoutes.resetPassword,
        builder: (_, _) => SetNewPasswordScreen()),
    GoRoute(
        path: AppRoutes.resetSuccess,
        builder: (_, _) => const PasswordUpdatedScreen()),

    // Persistent shell: sidebar stays, each branch is its own URL + state.
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AdminShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppRoutes.dashboard, builder: (_, _) => DashboardScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppRoutes.users,
              builder: (_, _) => UserManagementScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppRoutes.payment, builder: (_, _) => PaymentScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppRoutes.administrators,
              builder: (_, _) => AdministratorsScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: AppRoutes.settings, builder: (_, _) => SettingsScreen()),
        ]),
      ],
    ),
  ],
);