import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:shopping_app/widget/Bottom_button.dart';
import 'package:shopping_app/widget/reusable_card.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController confirmPwd = TextEditingController();

class SignUpPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = <TextSpan>[
      TextSpan(text: 'Already have an account? '),
      TextSpan(
        text: 'Login here',
        style: TextStyle(color: Colors.purple),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData.fallback(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Let\'s Get Started!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              Text(
                'Create an account to Shopping app get all features',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              SizedBox(
                height: 10.0,
              ),
              ReusableCard(
                controller: name,
                text: 'Full Name',
                icon: Icons.person_outline,
              ),
              SizedBox(
                height: 10.0,
              ),
              ReusableCard(
                controller: email,
                text: 'Email',
                icon: Icons.email_outlined,
              ),
              SizedBox(
                height: 10.0,
              ),
              ReusableCard(
                controller: phone,
                text: 'Phone Number',
                icon: Icons.phone_android_outlined,
              ),
              SizedBox(
                height: 10.0,
              ),
              ReusableCard(
                controller: password,
                text: 'Password',
                hint: true,
                icon: Icons.lock_open,
              ),
              SizedBox(
                height: 10.0,
              ),
              ReusableCard(
                controller: confirmPwd,
                icon: Icons.lock_open,
                text: 'Confirm Password',
                hint: true,
              ),
              SizedBox(
                height: 40.0,
              ),
              BottomButton(
                onTap: (() async {
                  print(email.toString());
                  print(password.toString());
                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);

                    // if (newUser != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                    // }
                  } catch (e) {
                    print(e);
                  }
                }),
                text: 'Create',
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                // width: 20.0,
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      children: textSpans,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
