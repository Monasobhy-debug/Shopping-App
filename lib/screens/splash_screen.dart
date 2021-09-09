import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //   controller = AnimationController(
    //     duration: Duration(
    //       seconds: 2,
    //     ),
    //     // vsync: controller,
    //   );
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SignInPage()));
    // });
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: SignInPage(),
        duration: 30000,
        imageSize: 200,
        imageSrc: 'images/shoppingLogo.png',
        // speed: 10,
        backgroundColor: Colors.white,
        speed: 2,
      ),
    );
  }
}
