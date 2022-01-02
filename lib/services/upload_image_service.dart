import 'dart:convert';
import 'package:http/http.dart' as http;

class UploadImage {
  String url = "http://127.0.0.1:8000";

  uploadImage(image, filename) async {
    var request =
        http.MultipartRequest("POST", Uri.parse(url + '/uploadfile/'));
    request.files.add(
      http.MultipartFile.fromBytes('file', image,
          filename: filename.split("/").last),
    );

    var response = await request.send();
    var result = await http.Response.fromStream(response);
    final imageRes = jsonDecode(result.body) as Map<String, dynamic>;
    return imageRes;
  }
}
