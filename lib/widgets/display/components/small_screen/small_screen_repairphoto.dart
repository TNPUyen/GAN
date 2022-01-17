// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:gan/services/upload_image_service.dart';
import 'package:gan/widgets/display/image_display.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/widgets/display/components/buttons/large_screen_button.dart';
import 'package:path_provider/path_provider.dart';

class SmallScreenRepairPhotoContent extends StatefulWidget {
  final void Function() upload;
  final void Function() repair;
  final Uint8List? imageSelected;
  final File? image;
  final bool? isRepair;
  final bool? isLoading;

  const SmallScreenRepairPhotoContent(
      {Key? key,
      required this.upload,
      required this.repair,
      required this.imageSelected,
      required this.image,
      required this.isRepair,
      required this.isLoading})
      : super(key: key);

  @override
  _SmallScreenRepairPhotoContentState createState() =>
      _SmallScreenRepairPhotoContentState();
}

class _SmallScreenRepairPhotoContentState
    extends State<SmallScreenRepairPhotoContent> {
  @override
  void initState() {
    // repair = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fileName = widget.image != null ? basename(widget.image!.path) : "";
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.8,
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
              widget.image != null
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
                      width: size.width * 0.8,
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
                    color: widget.image != null || widget.isRepair == true
                        ? Colors.white
                        : active,
                    icon: Icons.upload,
                  ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  if (widget.image != null && widget.isRepair == false)
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
                      onPressed: () =>
                          _download(widget.imageSelected, fileName),
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

  // void _upload() async {
  //   dynamic path;
  //   final result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['jpg', 'png'],
  //       allowMultiple: false);

  //   if (result == null) return;
  //   final name = result.files.single.name;
  //   kIsWeb ? path = result.files.single.bytes : path = result.files.single.path;
  //   setState(() => {
  //         kIsWeb
  //             ? {image = File(name), imageSelected = path}
  //             : {
  //                 image = File(path!),
  //                 imageSelected = File(path!).readAsBytesSync()
  //               },
  //         repair = false
  //       });
  //   // final result = await FilePickerCross.importFromStorage(
  //   // //     // type: FileTypeCross.image,
  //   // //     // fileExtension: 'jpg, png'
  //   // );
  // }

// void _repair(imageSelected, filename) async{

//     UploadImage uploadImage = UploadImage();
//     var result = await uploadImage.uploadImage(imageSelected, filename);
//     imageRepaired = base64Decode(result['content']);
//     setState(() => {repair = true});

//     // print(check);
//   }

  _download(image, fileName) async {
    if (kIsWeb) {
    } else {
      Directory? dir = await getExternalStorageDirectory();
      if (await dir!.exists()) {
        File saveFile = File(dir.path + "/$fileName");
        await saveFile.writeAsBytes(image);
        if (image != null) {
          await ImageGallerySaver.saveImage(image);
        }
      }
    }
  }
}
