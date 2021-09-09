import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/main_page.dart';
import 'package:shopping_app/screens/sign_up_page.dart';
import 'package:shopping_app/widget/Bottom_button.dart';
import 'package:shopping_app/widget/register_ways_container.dart';
import 'package:shopping_app/widget/reusable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // bool showSpinner = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<TextSpan> textSpans = <TextSpan>[
    TextSpan(text: 'Don\'t have on account? '),
    TextSpan(text: 'Sign Up', style: TextStyle(color: Colors.purple)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      child: Form(
        key: formKey,
        child: ListView(children: [
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              height: 130.0,
              width: 150.0,
              child: Image.asset(
                'images/shopping.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Welcome back!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'log in to your existent  account of Shopping App',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
          SizedBox(
            height: 30.0,
          ),
          ReusableCard(
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              validationMethod(value, 'please provide your email');
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
            },
            controller: email,
            text: 'Email',
            icon: Icons.email_outlined,
          ),
          ReusableCard(
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              validationMethod(value, 'please provide a password');
              if (value.trim().length < 8) {
                return 'Password must be at least 8 characters in length';
              }
            },
            controller: password,
            text: 'Password',
            icon: Icons.lock_open,
            hint: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Forgot Password?',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.purple),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          BottomButton(
            onTap: () async {
              print(email);
              try {
                bool valid = formKey.currentState!.validate();

                if (valid) {
                  await _auth.signInWithEmailAndPassword(
                      email: email.text, password: password.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign in Successfully')),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                }
              } catch (e) {
                print(e);
              }
            },
            text: 'LOG IN',
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Or connect using',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RegisterWaysContainer(
                  color: Colors.blue.shade800,
                  widget: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  text: 'Facebook'),
              RegisterWaysContainer(
                  color: Colors.red,
                  widget: Container(
                    height: 20.0,
                    width: 30.0,
                    child: Image.asset(
                      'images/google.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  text: 'Google'),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: textSpans,
              ),
            ),
          ),
        ]),
      ),
    )));
  }
}
