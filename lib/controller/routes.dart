import 'package:flutter/material.dart';
import 'package:weather_application/view/splash/splash_page.dart';

import '../view/favorite/favorite_page.dart';
import '../view/home/home_page.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=> const HomePage(),
    '/fav':(context)=> const FavoritePage(),
    '/view':(context)=> const SplashPage(),
  };
}
