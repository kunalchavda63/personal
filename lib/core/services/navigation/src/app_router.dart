import 'package:go_router/go_router.dart';
import 'package:personal/core/services/navigation/src/route_constants.dart';
import 'package:personal/features/artists/artists.dart';
import 'package:personal/features/onboarding/login_screen.dart';
import 'package:personal/features/onboarding/onboarding_screen.dart';
import 'package:personal/features/onboarding/otp_screen.dart';
import 'package:personal/features/onboarding/register_screen.dart';

final goRouterConfig = GoRouter(
  initialLocation: RoutesEnum.artists.path,
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
  ],
);
