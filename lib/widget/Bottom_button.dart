import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.onTap});
  final String text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.purple,
            ),
            child: Center(
                child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
    //     ElevatedButton(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
    //   ),
    //   onPressed: () {},
    //   child: Text(text, textAlign: TextAlign.center),
    // );
  }
}
