import 'package:go_router/go_router.dart';
import 'package:joud_pay/features/auth/presentation/get_location.dart';
import 'package:joud_pay/features/onboarding/presentation/on_boarding_Screen.dart';
import 'package:joud_pay/features/splash_screen/presentation/splash_screen.dart';

import '../../features/auth/presentation/select_country_screen.dart';
import '../../features/auth/presentation/select_sms_screen.dart';

abstract class AppRoute {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/onboard",
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: "/select_country",
        builder: (context, state) => const SelectCountryScreen(),
      ),
      GoRoute(
        path: "/get_location",
        builder: (context, state) => const GetLocationScareen(),
      ),
      GoRoute(
        path: "/select_sms_screen",
        builder: (context, state) => const SelectSmsScreen(),
      ),
    ],
  );
}
