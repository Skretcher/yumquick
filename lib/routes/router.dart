import 'package:go_router/go_router.dart';

// Import your screens
import 'package:yumquick/screens/splash_screen.dart';
import 'package:yumquick/screens/onboarding_screen.dart';
import 'package:yumquick/screens/welcome_screen.dart';
import 'package:yumquick/screens/login_screen.dart';
import 'package:yumquick/screens/signup_screen.dart';
import 'package:yumquick/screens/home_screen.dart';
import 'package:yumquick/screens/my_orders_screen.dart';
import 'package:yumquick/screens/menu_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const MyOrdersScreen(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => const MenuScreen(),
    ),
  ],
);
