import 'package:personal/features/panel_demo/panel_demo.dart';

import 'routes.dart';

final goRouterConfig = GoRouter(
  initialLocation: RoutesEnum.onboard.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: RoutesEnum.onboard.name,
      path: RoutesEnum.onboard.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: OnboardingScreen()),
    ),
    GoRoute(
      name: RoutesEnum.login.name,
      path: RoutesEnum.login.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      name: RoutesEnum.register.name,
      path: RoutesEnum.register.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: RegisterScreen()),
    ),
    GoRoute(
      name: RoutesEnum.otp.name,
      path: RoutesEnum.otp.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: OtpScreen()),
    ),
    GoRoute(
      name: RoutesEnum.artists.name,
      path: RoutesEnum.artists.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: Artists()),
    ),

    GoRoute(
      name: RoutesEnum.androidScreen.name,
      path: RoutesEnum.androidScreen.path,
      pageBuilder: (_, __) => NoTransitionPage(child: AHomeScreen()),
    ),
    GoRoute(
      name: RoutesEnum.panelDemo.name,
      path: RoutesEnum.panelDemo.path,
      pageBuilder: (_, __) => NoTransitionPage(child: PanelDemo()),
    ),
  ],
);
