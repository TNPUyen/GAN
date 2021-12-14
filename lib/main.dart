// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gan/controllers/navbar_controller.dart';
import 'package:gan/layout.dart';
import 'package:gan/pages/home/home.dart';
import 'package:gan/pages/repairphoto/repairphoto_page.dart';
import 'package:gan/routes/route.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  Get.put(NavBarController());
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/'+homePageRoute,
      getPages: [
        GetPage(name: '/:page_name', page: () => SiteLayout()),
      ],
    );
  }
}
