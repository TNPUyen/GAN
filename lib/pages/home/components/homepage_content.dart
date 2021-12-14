
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/routes/route.dart';
import 'package:gan/widgets/buttons/custom_button.dart';

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
            SizedBox(
              width: size.width * 0.8,
              child: Image.asset(
                'assets/images/editphoto.png',
              ),
            ),
          Text(
            'GAN',
            style: TextStyle(fontSize: ResponsiveWidget.isSmallScreen(context) ? 50 : 80, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: size.width * 0.005,
          ),
          Text(
            'Lorem ipsum',
            style: TextStyle(fontSize: ResponsiveWidget.isSmallScreen(context) ? 32 : 50, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: size.width * 0.005,
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w300, height: 1.6),
          ),
          SizedBox(
            height: size.width * 0.01,
          ),
          Wrap(
            runSpacing: 8,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              MainCustomButton(
                title: 'Sửa ảnh',
                active: active,
                nonactive: nonactive,
                dark: true,
                pageRoute: '/'+ repairPhotoRoute
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              MainCustomButton(
                title: 'Tạo ảnh cũ',
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
