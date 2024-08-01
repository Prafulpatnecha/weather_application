import 'package:flutter/material.dart';
import 'package:weather_application/controller/routes.dart';
import 'package:weather_application/utils/theme_create.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeCreate.themeDataLight,
      darkTheme: ThemeCreate.themeDataDark,
      themeMode: ThemeMode.system,
      initialRoute: "/view",
      routes: AppRoutes.routes,
    );
  }
}
