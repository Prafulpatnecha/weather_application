import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/provider/home_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed('/');
    },);
    HomeProvider homeProvider=Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/image/w.png',),width: 150),
            Text('Weather Check',style: TextStyle(color: Theme.of(context).focusColor,fontWeight: FontWeight.bold,fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
