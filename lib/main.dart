import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task_app/features/log_in/log_in_screen.dart';

import 'config/app_route/routes_config.dart';
import 'config/theme/app_theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Scube Task App',
        routerConfig: appRoute,
        theme: AppThemeConfig.lightTheme,
        darkTheme: AppThemeConfig.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}



