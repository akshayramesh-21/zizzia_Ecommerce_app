
import 'dart:developer';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
Future<void> editWithImg(File? image, String phone, String name) async {
  log('edit user function');
  final token = await tokenGet();
  final String url = "http://${ip}:3000/flutter/edituser";

  try {
    final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

    // Add name and phone fields to request
    request.fields['name'] = name;
    request.fields['phoneno'] = phone;

    // Add image file to request if available
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    }

    final http.StreamedResponse response = await request.send();
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      log('Edit operation successful');
    } else {
      log('Edit operation failed with status code: $statusCode');
    }
  } catch (e) {
    log('Exception: $e');
  }
}










  //  Future<void> editUser(File name, int phone,  image)  async {
  //   try {
  //     final response = await http
  //         .post(Uri.parse("http://${ip}:3000/flutter/edituser"), headers: {
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     }, body: {
  //       'name': name,
  //       'phoneno': phone,
  //       'image': image
  //     });

  //     if (response.statusCode == 200) {
  //       final jSonDecode = json.decode(response.body);
  //       if (jSonDecode['success'] == 'success') ;
  //     }
  //   } catch (e) {}
  // }