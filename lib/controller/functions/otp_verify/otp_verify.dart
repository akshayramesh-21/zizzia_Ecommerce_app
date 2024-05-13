import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/login/login.dart';

Future<bool> otpVerifyFunction(
   context, dynamic userid, String otp) async {
  log("${userid}");
  log(otp);

  if (userid == null || otp.isEmpty) {
    log("Error: userid or otp is null or empty");
    log("${userid}");
    log(otp);
    return false;
  }

  try {
    final response = await http.post(
      Uri.parse("http://${ip}:3000/flutter/validate-otp"),
      headers: {
        'content-type': 'application/x-www-form-urlencoded',
      },
      body: {
        'id': userid.toString(),
        'otp': otp,
      },
    );

    log('${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse["success"] == "success") {
        log('${jsonResponse}');
  
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
        return true; // OTP verification successful
      }
    }
  } catch (e) {
    print("Error: $e");
  }
  return false; // OTP verification failed
}
