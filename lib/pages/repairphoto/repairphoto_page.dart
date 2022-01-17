// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/services/upload_image_service.dart';
import 'package:gan/widgets/display/components/large_screen/large_screen_repairphoto.dart';
import 'package:gan/widgets/display/components/medium_screen/medium_screen_repairphoto.dart';
import 'package:gan/widgets/display/components/small_screen/small_screen_repairphoto.dart';
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
  Uint8List? imageRepaired;
  bool? repair;
  bool? isLoading;
  String? base64Image;

  @override
  void initState() {
    repair = false;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String fileName = image != null ? basename(image!.path) : "";

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Phục hồi ảnh",
              style: GoogleFonts.mavenPro(
                fontSize: ResponsiveWidget.isLargeScreen(context)
                    ? 70
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 60
                        : 50,
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
          if (ResponsiveWidget.isLargeScreen(context))
            LargeScreenRepairPhotoContent(
              upload: _upload,
              repair: () => {_repair(imageSelected, fileName)},
              imageSelected: imageSelected,
              imageRepaired: imageRepaired,
              isRepair: repair,
              isLoading: isLoading,
            ),
          if (ResponsiveWidget.isMediumScreen(context))
            MediumScreenRepairPhotoContent(
              upload: _upload,
              repair: () => {_repair(imageSelected, fileName)},
              imageSelected: imageSelected,
              imageRepaired: imageRepaired,
              image: image,
              isRepair: repair,
              isLoading: isLoading,
            ),
          if (ResponsiveWidget.isSmallScreen(context))
            SmallScreenRepairPhotoContent(
              upload: _upload,
              repair: () => {_repair(imageSelected, fileName)},
              imageSelected: imageSelected,
              imageRepaired: imageRepaired,
              image: image,
              isRepair: repair,
              isLoading: isLoading,
            )
        ],
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
                : {
                    image = File(path!),
                    imageSelected = File(path!).readAsBytesSync()
                  },
            repair = false
          });

    base64Image = base64Encode(path!);

    setState(() => {image = File(name), imageSelected = path, repair = false});

    // result.exportToStorage();
  }

  void _repair(imageSelected, filename) async {
    UploadImage uploadImage = UploadImage();
    // Uint8List imageRepaired;
    if (isLoading == true) return;
    setState(() {
      isLoading = true;
    });

    // ignore: prefer_typing_uninitialized_variables
    var result;
    result = await uploadImage.uploadImage(imageSelected, filename);

    if (result != null) {
      // if (!kIsWeb) {
      //   image!.writeAsBytesSync(base64Decode(result['content']));print('vào đây');
      // }
      setState(() => {
            repair = true,
            imageRepaired = base64Decode(result['content']),
            isLoading = false
          });
    }
  }

  // Future _download(image, fileName) async {
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
  // }
}
