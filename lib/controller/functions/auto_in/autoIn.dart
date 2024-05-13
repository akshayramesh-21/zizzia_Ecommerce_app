import 'dart:developer';




import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zizzia_e_commerce/view/pages/login/login.dart';
import 'package:zizzia_e_commerce/view/widgets/bottom_nav.dart';

Future<void> autoSignIn(context) async {
  try {log('autoSign');
    final tokens = await Hive.openBox("TokenData");
    final tokenValue = tokens.get('token') as String?;
    log("Token value: $tokenValue");

    if (tokenValue != null && tokenValue.isNotEmpty) {
      log("Navigating to Home Page");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      log("Navigating to Login Page");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  } catch (e) {
    log("Error in auto sign-in: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: $e. Please try again."),
      ),
    );
    // Navigate to login page in case of any error
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  } 
}