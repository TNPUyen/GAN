// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/services/upload_image_service.dart';
import 'package:gan/widgets/display/image_display.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/widgets/display/components/buttons/large_screen_button.dart';

class MediumScreenRepairPhotoContent extends StatefulWidget {
  final void Function() upload;
  final void Function() repair;
  final Uint8List? imageSelected;
  final File? image;
  final bool? isRepair;
  final bool? isLoading;

  const MediumScreenRepairPhotoContent(
      {Key? key,
      required this.upload,
      required this.repair,
      required this.imageSelected,
      required this.image,
      required this.isRepair,
      required this.isLoading})
      : super(key: key);
  @override
  _MediumScreenRepairPhotoContentState createState() =>
      _MediumScreenRepairPhotoContentState();
}

class _MediumScreenRepairPhotoContentState
    extends State<MediumScreenRepairPhotoContent> {
  @override
  void initState() {
    // repair = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final fileName = image != null ? basename(image!.path) : "";
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.01),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.width * 0.01,
          ),
          child: Wrap(
            // runSpacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: <Widget>[
              widget.imageSelected != null
                  ? widget.isRepair == true
                      ? RepairedImageDisplay(
                          imageSelected: widget.imageSelected,
                          imageRepaired: widget.image,
                          size: size)
                      : widget.isLoading == true
                          ? SizedBox(
                              width: size.width * 0.6,
                              height: size.height * 0.5,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            )
                          : SeletedImageDisplay(
                              imageSelected: widget.imageSelected,
                              imageRepaired: widget.image,
                              repair: widget.isRepair!,
                              size: size)
                  : SizedBox(
                      child: Image.asset(
                      "assets/images/upload_image.png",
                      width: size.width * 0.6,
                      height: size.height * 0.5,
                    )),
              SizedBox(
                width: size.width * 0.01,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LargeScreenButton(
                    onPressed: widget.upload,
                    title: "Tải ảnh lên",
                    color:
                        widget.imageSelected != null || widget.isRepair == true
                            ? Colors.white
                            : active,
                    icon: Icons.upload,
                  ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (widget.imageSelected != null && widget.isRepair == false)
                    LargeScreenButton(
                      onPressed: () => widget.repair(),
                      title: "Phục hồi ảnh",
                      color: active,
                      icon: Icons.auto_fix_high,
                    ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (widget.isRepair == true)
                    LargeScreenButton(
                      onPressed: () => {},
                      title: "Tải ảnh xuống",
                      color: active,
                      icon: Icons.download,
                    ),
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

  _download(image, fileName) async {}
}
