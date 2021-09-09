import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/home-page.dart';
import 'package:shopping_app/screens/main_page.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_app/screens/splash_screen.dart';
import 'package:shopping_app/model/shopping_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => print('completed'));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShoppingData>(
      create: (context) => ShoppingData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
