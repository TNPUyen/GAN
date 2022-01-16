import 'package:flutter/material.dart';

class BigImage extends StatelessWidget {
  const BigImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: Image.asset(
        'assets/images/editphoto.png',
      ),
    );
  }
}
