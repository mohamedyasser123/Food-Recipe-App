import 'package:flutter/material.dart';
import 'package:rec_app/presention/screens/login_screen.dart';
import '../../presention/screens/create_account_screen.dart';
import '../../presention/screens/search_recipes_screen.dart';
import '../../presention/screens/splash_screen.dart';
import '../../widgets/main_layout_widget.dart';
import 'app_routes.dart';
class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.createAccountScreen:
        return MaterialPageRoute(builder: (_) => CreateAccountScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) =>  MainLayout());
      case AppRoutes.searchRecipesScreen:
        return MaterialPageRoute(builder: (_) =>  SearchRecipesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route not found")),
          ),
        );
    }
  }
}