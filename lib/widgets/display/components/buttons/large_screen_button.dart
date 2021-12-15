// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';

class LargeScreenButton extends StatelessWidget {
  final onPressed;
  final String title;
  final Color color;
  final IconData icon;
  const LargeScreenButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        // padding: EdgeInsets.all(20.0),
        fixedSize: Size(180, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black87,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: lightButtonTextStyle,
          ),
        ],
      ),
    );
  }
}
