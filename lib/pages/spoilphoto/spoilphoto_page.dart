// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/widgets/display/components/large_screen/large_screen_repairphoto.dart';
import 'package:gan/widgets/display/components/medium_screen/medium_screen_repairphoto.dart';
import 'package:gan/widgets/display/components/small_screen/small_screen_repairphoto.dart';
import 'package:google_fonts/google_fonts.dart';

class SpoilPhotoPage extends StatefulWidget {
  const SpoilPhotoPage({Key? key}) : super(key: key);

  @override
  _SpoilPhotoPageState createState() => _SpoilPhotoPageState();
}

class _SpoilPhotoPageState extends State<SpoilPhotoPage> {
  File? image;
  Uint8List? imageSelected;
  bool? repair;

  @override
  void initState() {
    repair = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Tạo bộ lọc cho ảnh",
              style: GoogleFonts.mavenPro(
                fontSize: 70,
                fontWeight: FontWeight.w800,
                letterSpacing: 3,
                height: 1.6,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // if (ResponsiveWidget.isLargeScreen(context))
          // LargeScreenRepairPhotoContent(),
          // if (ResponsiveWidget.isMediumScreen(context))
          //   MediumScreenRepairPhotoContent(),
          // if (ResponsiveWidget.isSmallScreen(context))
          //   SmallScreenRepairPhotoContent()
        ],
      ),
    );
  }
}
