import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage("assets/images/route blue.png"),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(18),
              child: Text(
                "supervised by Mohamed Nabil",
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
