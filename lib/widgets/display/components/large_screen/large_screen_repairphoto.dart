// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/widgets/display/image_display.dart';
import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/widgets/display/components/buttons/large_screen_button.dart';

class LargeScreenRepairPhotoContent extends StatefulWidget {
  final void Function() upload;
  final void Function() repair;
  final Uint8List? imageSelected;
  final Uint8List? imageRepaired;
  final bool? isRepair;
  final bool? isLoading;

  const LargeScreenRepairPhotoContent(
      {Key? key,
      required this.upload,
      required this.repair,
      required this.imageSelected,
      required this.imageRepaired,
      required this.isRepair,
      required this.isLoading})
      : super(key: key);

  @override
  _LargeScreenRepairPhotoContentState createState() =>
      _LargeScreenRepairPhotoContentState();
}

class _LargeScreenRepairPhotoContentState
    extends State<LargeScreenRepairPhotoContent> {
  // File? image;
  // Uint8List? imageSelected;
  // Uint8List? imageRepaired;
  // bool? repair;
  // String? base64Image;

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
      width: widget.isRepair == true
          ? size.width * 0.85
          : widget.isLoading == true
              ? size.width * 0.85
              : size.width * 0.53,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.01),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * 0.01, horizontal: size.width * 0.01),
          child: Row(
            // runSpacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // alignment: WrapAlignment.center,
            children: [
              widget.imageSelected != null
                  ? widget.isRepair == true
                      ? Row(
                          mainAxisAlignment:
                              ResponsiveWidget.isMediumScreen(context)
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                          children: [
                            SeletedImageDisplay(
                                imageSelected: widget.imageSelected,
                                repair: widget.isRepair!,
                                size: size),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            RepairedImageDisplay(
                                imageSelected: widget.imageRepaired,
                                size: size),
                          ],
                        )
                      : widget.isLoading == true
                          ? Row(
                              mainAxisAlignment:
                                  ResponsiveWidget.isMediumScreen(context)
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.start,
                              children: [
                                SeletedImageDisplay(
                                    imageSelected: widget.imageSelected,
                                    repair: widget.isRepair!,
                                    size: size),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                SizedBox(
                                  width: ResponsiveWidget.isLargeScreen(context)
                                      ? size.width * 0.3
                                      : size.width * 0.6,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                ),
                              ],
                            )
                          : SeletedImageDisplay(
                              imageSelected: widget.imageSelected,
                              repair: widget.isRepair!,
                              size: size)
                  : SizedBox(
                      child: Image.asset(
                      "assets/images/upload_image.png",
                      width: size.width * 0.3,
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
}
