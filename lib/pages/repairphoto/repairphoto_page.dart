// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:convert';
// import 'dart:html' hide File;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/pages/repairphoto/components/large_screen/large_screen_repairphoto.dart';
// import 'package:gan/widgets/navbar_desktop.dart';
import 'package:gan/widgets/image_display.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

class RepairPhotoPage extends StatefulWidget {
  const RepairPhotoPage({Key? key}) : super(key: key);

  @override
  _RepairPhotoPageState createState() => _RepairPhotoPageState();
}

class _RepairPhotoPageState extends State<RepairPhotoPage> {
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
    // final fileName = image != null ? basename(image!.path) : "";

    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "Sửa ảnh cũ",
            style: GoogleFonts.mavenPro(
              fontSize: 50,
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
        LargeScreenRepairPhotoContent(repair: repair, size: size, imageSelected: imageSelected)
      ],
    );
  }

  void _uploadImage() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: false);

    if (result == null) return;
    final name = result.files.single.name;
    final path = result.files.single.bytes;

    setState(() => {image = File(name), imageSelected = path, repair = false});
  }

  void _repair() {
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
