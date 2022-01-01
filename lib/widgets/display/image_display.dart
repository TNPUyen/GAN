import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/helpers/responsive.dart';

class RepairedImageDisplay extends StatelessWidget {
  const RepairedImageDisplay({
    Key? key,
    this.imageSelected,
    this.imageRepaired,
    required this.size,
  }) : super(key: key);

  final Uint8List? imageSelected;
  final File? imageRepaired;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SAU",
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
                : size.width * 0.6,
            child: kIsWeb ? Image.memory(
              imageSelected!,
              // width: size.width * 0.3,
              height: size.height * 0.5,  
            ): Image.file(
              imageRepaired!,
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
    this.imageSelected,
    this.imageRepaired,
    required this.repair,
    required this.size,
  }) : super(key: key);

  final Uint8List? imageSelected;
  final File? imageRepaired;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "TRƯỚC",
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
                : size.width * 0.6,
            child:  kIsWeb
                ? Image.memory(
                    imageSelected!,
                    height: size.height * 0.5,
                  )
                : Image.file(
                    imageRepaired!,
                    // width: repair == true ? size.width * 0.3 : size.width * 0.5,
                    height: size.height * 0.5,
                  )),
      ],
    );
  }
}
