import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/helpers/responsive.dart';

class RepairedImageDisplay extends StatelessWidget {
  const RepairedImageDisplay({
    Key? key,
    required this.imageSelected,
    required this.size,
  }) : super(key: key);

  final Uint8List? imageSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "AFTER",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            height: 1.6,
            color: lightTextColor,
          ),
        ),
        SizedBox(
            width: ResponsiveWidget.isLargeScreen(context)
                ? size.width * 0.3
                : size.width * 0.5,
            child: Image.memory(
              imageSelected!,
              // width: size.width * 0.3,
              height: size.height * 0.5,
            )),
      ],
    );
  }
}

class SeletedImageDisplay extends StatelessWidget {
  final bool repair;

  const SeletedImageDisplay({
    Key? key,
    required this.imageSelected,
    required this.repair,
    required this.size,
  }) : super(key: key);

  final Uint8List? imageSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "BEFORE",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            height: 1.6,
            color: lightTextColor,
          ),
        ),
        SizedBox(
            width: ResponsiveWidget.isLargeScreen(context)
                ? size.width * 0.3
                : size.width * 0.5,
            child: Image.memory(
              imageSelected!,
              // width: repair == true ? size.width * 0.3 : size.width * 0.5,
              height: size.height * 0.5,
            )),
      ],
    );
  }
}