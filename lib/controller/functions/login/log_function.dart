import 'dart:convert';
import 'dart:developer';



import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';

Future<bool> loginFunction(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse("http://${ip}:3000/flutter/fuser_signin"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    log(response.statusCode.toString());
    log(response.body.toString());

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['success'] == 'success') {
       await tokenStore(jsonResponse["token"]);
     
      

        return true; // Login successful
      }
    }
  } catch (e) {
    print("Error: $e");
    throw Exception(e.toString());
  }

  return false; // Login failed
}
