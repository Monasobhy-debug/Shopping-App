import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.text,
      required this.icon,
      this.hint = false,
      required this.controller});
  final String text;
  final IconData icon;
  final bool hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: Colors.purple, width: 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
              controller: controller,
              obscureText: hint,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.purple),
                border: InputBorder.none,
                labelText: text,
                icon: Icon(
                  icon,
                  color: Colors.purple,
                ),
              )),
        ),
      ),
    );
  }
}
