import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_c10_str/layout/home.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const Center(
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: const Image(
                image: AssetImage("assets/images/route blue.png"),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(18),
              child: const Text(
                "Supervised by Mohamed Hamoda",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff39A552)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
