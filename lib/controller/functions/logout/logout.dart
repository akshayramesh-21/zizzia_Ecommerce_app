
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zizzia_e_commerce/view/pages/login/login.dart';

logoOutFunction(context)  async{

  final tokens = await Hive.openBox("TokenData");
  await tokens.clear();

  await tokens.deleteFromDisk();

  Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => LoginPage()),
  (route) => false,
);





}