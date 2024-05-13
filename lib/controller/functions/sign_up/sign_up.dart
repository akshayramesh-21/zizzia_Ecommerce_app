import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/otp_verfication/otp_get.dart';

Future<bool> signUpFunction(BuildContext context, String name, String gmail,
    int phone, String password) async {
  try {
    final response = await http.post(
      Uri.parse("http://${ip}:3000/flutter/fuser_registration"),
      headers: {'content-type': 'application/x-www-form-urlencoded'},
      body: {
        'name': name,
        'email': gmail,
        'phoneno': phone.toString(),
        'password': password
      },
    );

    log(response.body.toString());

    if (response.statusCode == 200) {
      final jsonResponse = await json.decode(response.body);
      log("if-1: ${jsonResponse.toString()}"); // Log jsonResponse as a string
      if (jsonResponse["success"] == true) {
        final userGet = await jsonResponse["userid"];

        log('ssfswf ${userGet}'); // No need to call userId function

        // Navigate to OTP verification screen
        if (userGet != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpGet(userid: userGet),
            ),
          );
        } 


       



        
        
     




        // Sign up successful
      }
       return true; 
    }
  } catch (e) {
    print('gggg ${e}');
  }

  return false; // Sign up failed
}
