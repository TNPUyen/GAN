// ignore_for_file: must_be_immutable, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gan/routes/route.dart';
import 'package:gan/widgets/navbar/desktop/desktop_navbar.dart';
import 'package:gan/widgets/navbar/mobile/mobile_navbar.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/widgets/navbar/mobile/drawer.dart';
import 'package:get/get.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  Widget? view;
  SiteLayout() {
    view = innerRoute[Get.parameters['page_name']];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? mobileNavbar(scaffoldKey)
          : PreferredSize(
              preferredSize: Size(size.width, 950),
              child: DesktopNavbar(),
            ),
      drawer: SideMenu(),
      body: view,
    );
  }
}
