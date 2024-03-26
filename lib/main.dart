import 'package:flutter/material.dart';
import 'package:news_c10_str/layout/home.dart';
import 'package:news_c10_str/screens/article_details.dart';
import 'package:news_c10_str/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),

      },
    );
  }
}
