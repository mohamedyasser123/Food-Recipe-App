import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rec_app/providers/meal_provider.dart';
import 'package:rec_app/services/meal_service.dart';

import 'core/constants/app_colors.dart';
import 'core/network/api_client.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MealProvider(
             MealService(
               ApiClient(client: http.Client()),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primary100,
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primary100,
              foregroundColor: AppColors.white,
            ),
          ),
          initialRoute: AppRoutes.splashScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}

