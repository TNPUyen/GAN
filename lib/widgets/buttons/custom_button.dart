// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/widgets/buttons/components/custom_button_animation.dart';
import 'package:get/get.dart';

class MainCustomButton extends StatelessWidget {
  final String title;
  final Color active;
  final Color nonactive;
  final bool dark;
  final String pageRoute;

  const MainCustomButton(
      {Key? key,
      required this.title,
      required this.active,
      required this.nonactive,
      required this.dark,
      required this.pageRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonHoverAnimation(
      height: 50,
      width: ResponsiveWidget.isSmallScreen(context)? 150 :200,
      thickness: 1.2,
      curve: Curves.easeInOutSine,
      milliseconds: 500,
      onTap: () {
        Get.toNamed(pageRoute);
      },
      active: active,
      nonactive: nonactive,
      title: title,
      dark: dark,
    );
  }
}
