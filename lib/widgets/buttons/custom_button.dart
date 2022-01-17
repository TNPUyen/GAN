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
  final int index;

  const MainCustomButton(
      {Key? key,
      required this.title,
      required this.active,
      required this.nonactive,
      required this.dark,
      required this.pageRoute, 
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonHoverAnimation(
      height: 50,
      width: changeWidth(context),
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

  double changeWidth(context){
    if(ResponsiveWidget.isSmallScreen(context)){
      if(index == 0){
        return 150;
      }else{
        return 205;
      }
    }else{
      if(index == 0){
        return 200;
      }else{
        return 250;
      }
    }
  }
}
