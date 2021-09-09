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
String? validationMethod(String? value, String textValidator) {
  if (value == null || value.isEmpty) {
    return textValidator;
  }
  return null;
}

class SignUpPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Form(
            key: formKey,
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
                SizedBox(
                  height: 10.0,
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
                  textInputType: TextInputType.name,
                  validator: (value) {
                    validationMethod(value, 'Enter your Name');
                    if (value.trim().length < 4) {
                      return 'Username must be at least 4 characters in length';
                    }
                  },
                  controller: name,
                  text: 'Full Name',
                  icon: Icons.person_outline,
                ),
                SizedBox(
                  height: 10.0,
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
                SizedBox(
                  height: 10.0,
                ),
                ReusableCard(
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    validationMethod(value, 'please provide a phone number');
                    if (value.trim().length < 11) {
                      return 'Phone number must 11 number in length';
                    }
                  },
                  controller: phone,
                  text: 'Phone Number',
                  icon: Icons.phone_android_outlined,
                ),
                SizedBox(
                  height: 10.0,
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
                  hint: true,
                  icon: Icons.lock_open,
                ),
                SizedBox(
                  height: 10.0,
                ),
                ReusableCard(
                  textInputType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    validationMethod(value,
                        'the confirm Password confirmation dose not match ');
                    if (value != password.text.toString()) {
                      return 'Confirmation password does not match the entered password';
                    }
                  },
                  controller: confirmPwd,
                  icon: Icons.lock_open,
                  text: 'Confirm Password',
                  hint: true,
                ),
                SizedBox(
                  height: 30.0,
                ),
                BottomButton(
                  onTap: (() async {
                    print(email.toString());
                    print(password.toString());
                    print(confirmPwd.toString());
                    try {
                      var valid = formKey.currentState;
                      if (valid!.validate()) {
                        await _auth.createUserWithEmailAndPassword(
                            email: email.text, password: password.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign Up Successfully')),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
                  text: 'Create',
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  // width: 20.0,
                  margin: EdgeInsets.symmetric(horizontal: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
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
      ),
    );
  }
}
