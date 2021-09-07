import 'package:flutter/material.dart';

class RegisterWaysContainer extends StatelessWidget {
  final String text;
  final Widget widget;
  final Color color;

  RegisterWaysContainer(
      {required this.widget, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        width: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget,
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
