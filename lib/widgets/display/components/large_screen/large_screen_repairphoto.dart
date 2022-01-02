// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
// import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/services/upload_image_service.dart';
import 'package:gan/widgets/display/image_display.dart';
import 'package:path/path.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/widgets/display/components/buttons/large_screen_button.dart';

class LargeScreenRepairPhotoContent extends StatefulWidget {
  const LargeScreenRepairPhotoContent({Key? key}) : super(key: key);

  @override
  _LargeScreenRepairPhotoContentState createState() =>
      _LargeScreenRepairPhotoContentState();
}

class _LargeScreenRepairPhotoContentState
    extends State<LargeScreenRepairPhotoContent> {
  File? image;
  Uint8List? imageSelected;
  Uint8List? imageRepaired;
  bool? repair;
  String? base64Image;

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
      width: repair == true ? size.width * 0.8 : size.width * 0.48,
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
          child: Row(
            // runSpacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // alignment: WrapAlignment.center,
            children: <Widget>[
              imageSelected != null
                  ? repair == true
                      ? Row(
                          mainAxisAlignment:
                              ResponsiveWidget.isMediumScreen(context)
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                          children: [
                            SeletedImageDisplay(
                                imageSelected: imageSelected,
                                repair: repair!,
                                size: size),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            RepairedImageDisplay(
                                imageSelected: imageRepaired, size: size),
                          ],
                        )
                      : SeletedImageDisplay(
                          imageSelected: imageSelected,
                          repair: repair!,
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
                      onPressed: () => _repair(imageSelected, fileName),
                      title: "Phục hồi ảnh",
                      color: active,
                      icon: Icons.auto_fix_high,
                    ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (repair == true)
                    LargeScreenButton(
                      onPressed: () => _download(image, fileName),
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
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: false);
    // final result = await FilePickerCross.importFromStorage(
    //   type: FileTypeCross.image,
    //   fileExtension: 'jpg, png'
    // );

    if (result == null) return;
    final name = result.files.single.name;
    final path = result.files.single.bytes;
    base64Image = base64Encode(path!);

    setState(() => {image = File(name), imageSelected = path, repair = false});
    // result.exportToStorage();
  }

  void _repair(imageSelected, filename) async {
    UploadImage uploadImage = UploadImage();
    var result = await uploadImage.uploadImage(imageSelected, filename);
    imageRepaired = base64Decode(result['content']);
    setState(() => {repair = true});

    // print(check);
  }

  Future _download(image, fileName) async {
    // Uint8List pngBytes = image!.buffer.asUint8List();
    // final _base64 = base64Encode(pngBytes);
    // final anchorElement = AnchorElement()
    //   ..href = 'data:application/octet-stream;base64,$_base64'
    //   ..download = fileName + '_new';
    //
    // anchorElement.click();
    // // anchorElement.remove();
    // String? selectedDirectory = await FilePicker.platform.getDirectoryPath(dialogTitle: 'want to save it?');
    // print(selectedDirectory);
  }
}
