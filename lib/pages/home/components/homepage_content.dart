
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/pages/home/components/big_image.dart';
import 'package:gan/routes/route.dart';
import 'package:gan/widgets/buttons/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: size.width*0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          if (ResponsiveWidget.isSmallScreen(context))
            // SizedBox(
            //   width: size.width * 0.8,
            //   child: Image.asset(
            //     'assets/images/editphoto.png',
            //   ),
            // ),
            BigImage(size: size),
          Text(
            'GAN',
            style: GoogleFonts.mavenPro(fontSize: ResponsiveWidget.isSmallScreen(context) ? 40 : 80, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: size.width * 0.005,
          ),
          Text(
            'Generative Adversarial Network',
            style: GoogleFonts.mavenPro(fontSize: ResponsiveWidget.isSmallScreen(context) ? 28 : 50, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: size.width * 0.005,
          ),
          Text(
            'Ứng dụng mô hình mạng đối ngẫu tạo sinh trong phục hồi ảnh cũ',
            style:
                GoogleFonts.mavenPro(fontSize: 24, fontWeight: FontWeight.w300, height: 1.6),
          ),
          SizedBox(
            height: size.width * 0.025,
          ),
          Wrap(
            runSpacing: 8,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              MainCustomButton(
                index: 0,
                title: 'Phục hồi ảnh',
                active: active,
                nonactive: nonactive,
                dark: true,
                pageRoute: '/'+ repairPhotoRoute
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              MainCustomButton(
                index: 1,
                title: 'Tạo ảnh bộ lọc cho ảnh',
                active: active,
                nonactive: nonactive,
                dark: false,
                pageRoute: '/'+ spoilPhotoRoute
              ),
            ],
          )
        ],
      ),
    );
  }
}
