import 'package:flutter/material.dart';

int smallScreenWidth = 650;
int mediumScreenwidth = 852;
int largeScreenWidth = 1200;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenWidth;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenWidth;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenWidth &&
      MediaQuery.of(context).size.width <= largeScreenWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxHeight;
        if (maxWidth > largeScreenWidth) {
          return largeScreen;
        } else if(maxWidth >= smallScreenWidth && maxWidth <= largeScreenWidth){
          return mediumScreen;
        }else{
          return smallScreen;
        }
      },
    );
  }
}
