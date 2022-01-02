// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:gan/services/upload_image_service.dart';
import 'package:gan/widgets/display/image_display.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/widgets/display/components/buttons/large_screen_button.dart';

class MediumScreenRepairPhotoContent extends StatefulWidget {
  const MediumScreenRepairPhotoContent({Key? key}) : super(key: key);

  @override
  _MediumScreenRepairPhotoContentState createState() =>
      _MediumScreenRepairPhotoContentState();
}

class _MediumScreenRepairPhotoContentState
    extends State<MediumScreenRepairPhotoContent> {
  File? image;
  Uint8List? imageSelected;
  Uint8List? imageRepaired;
  bool? repair;

  @override
  void initState() {
    repair = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fileName = image != null ? basename(image!.path) : "";
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
              imageSelected != null
                  ? repair == true
                      ? RepairedImageDisplay(
                          imageSelected: imageSelected,
                          imageRepaired: image,
                          size: size)
                      : SeletedImageDisplay(
                          imageSelected: imageSelected,
                          imageRepaired: image,
                          repair: repair!,
                          size: size)
                  : SizedBox(
                      child: Image.asset(
                      "assets/images/upload_image.png",
                      width: size.width * 0.5,
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
                    onPressed: _upload,
                    title: "Tải ảnh lên",
                    color: imageSelected != null || repair == true
                        ? Colors.white
                        : active,
                    icon: Icons.upload,
                  ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (imageSelected != null && repair == false)
                    LargeScreenButton(
                      onPressed: _repair,
                      title: "Phục hồi ảnh",
                      color: active,
                      icon: Icons.auto_fix_high,
                    ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (repair == true)
                    LargeScreenButton(
                      onPressed: () => _repair(imageSelected, fileName),
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

  void _upload() async {
    dynamic path;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: false);

    if (result == null) return;
    final name = result.files.single.name;
    kIsWeb ? path = result.files.single.bytes : path = result.files.single.path;
    setState(() => {
          kIsWeb
              ? {image = File(name), imageSelected = path}
              : image = File(path!),
          repair = false
        });
  }

  void _repair(imageSelected, filename) async {
    UploadImage uploadImage = UploadImage();
    var result = await uploadImage.uploadImage(imageSelected, filename);
    imageRepaired = base64Decode(result['content']);
    setState(() => {repair = true});
  }

  _download(image, fileName) async {
    // Uint8List pngBytes = image!.buffer.asUint8List();
    // final _base64 = base64Encode(pngBytes);
    // final anchorElement = AnchorElement()
    //   ..href = 'data:application/octet-stream;base64,$_base64'
    //   ..download = fileName + '_new';
    //
    // anchorElement.click();
    // anchorElement.remove();
  }
}
