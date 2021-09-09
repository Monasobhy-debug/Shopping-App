import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_up_page.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.text,
      required this.icon,
      this.hint = false,
      required this.controller,
      required this.validator,
      required this.textInputType});
  final String text;
  final IconData icon;
  final bool hint;
  final TextEditingController controller;
  final validator;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
              validator: validator,
              keyboardType: textInputType,
              cursorColor: Colors.purple,
              cursorHeight: 25.0,
              controller: controller,
              obscureText: hint,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Icon(
                      icon,
                      color: Colors.purple,
                    ),
                  ),
                  labelStyle: TextStyle(color: Colors.purple),
                  labelText: text,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.purple)))),
        ),
      ),
    );
  }
}
