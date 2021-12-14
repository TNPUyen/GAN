// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/pages/home/components/homepage_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.width * 0.005, horizontal: size.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.01),
              child: ResponsiveWidget.isSmallScreen(context)
                  ? SingleChildScrollView(child: HomePageContent(size: size))
                  : HomePageContent(size: size),
            ),
          ),
          if (ResponsiveWidget.isLargeScreen(context) ||
              ResponsiveWidget.isMediumScreen(context))
            Expanded(
              child: Image.asset(
                'assets/images/editphoto.png',
                height: size.height * 0.8,
              ),
            ),
        ],
      ),
    );
  }
}
