import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/detail_screen.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/home_screen.dart';
import 'package:kn_store_mobile_app/features/splash_screen/presentation/splash_screen.dart';

class AppRouter {
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/home_screen';
  static const String detailScreen = '/detail_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );

      case homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeScreen(),
        );

      case detailScreen:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DetailScreen(productId: productId),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Error: Unknown route'))),
        );
    }
  }
}
