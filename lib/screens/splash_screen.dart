import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: SignInPage(),
        duration: 3000,
        imageSize: 200,
        imageSrc: 'images/shoppingLogo.png',
        // speed: 10,
        backgroundColor: Colors.white,
        // speed: 2,
      ),
    );
  }
}
