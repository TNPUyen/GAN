
// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/widgets/image_display.dart';

class LargeScreenRepairPhotoContent extends StatelessWidget {
  const LargeScreenRepairPhotoContent({
    Key? key,
    required this.repair,
    required this.size,
    required this.imageSelected,
  }) : super(key: key);

  final bool? repair;
  final Size size;
  final Uint8List? imageSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: repair == true ? size.width * 0.8 : size.width * 0.45,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.01),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageSelected != null
                  ? repair == true
                      ? Row(
                          children: [
                            SeletedImageDisplay(
                                imageSelected: imageSelected,
                                repair: repair!,
                                size: size),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            RepairedImageDisplay(
                                imageSelected: imageSelected, size: size),
                          ],
                        )
                      : SeletedImageDisplay(
                          imageSelected: imageSelected,
                          repair: repair!,
                          size: size)
                  : SizedBox(
                      child: Image.asset(
                      "assets/images/image_upload.gif",
                      width: size.width * 0.3,
                      height: size.height * 0.5,
                    )),
              SizedBox(
                width: size.width * 0.01,
              ),
              Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            color: Colors.black87,
                          ),
                          Text(
                            "Upload Image",
                            style: lightButtonTextStyle,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (imageSelected != null)
                    InkWell(
                        onTap: (){},
                        child: Text(
                          "Repair Image",
                          style: lightButtonTextStyle,
                        )),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (repair == true)
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "Download Image",
                          style: lightButtonTextStyle,
                        )),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
