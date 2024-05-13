// import 'dart:developer';

// import 'package:hive_flutter/adapters.dart';

// Future<dynamic> userId(dynamic userid,) async {
//   if (userid != null) {
//     final userIdBox = await Hive.openBox("UserId");

//     userIdBox.put("userid", userid);
//     log("${userIdBox.values}");

//      // Assuming "userid" is the key used to store the user ID

//   //   log("Stored user ID in Hive: $userid");
//   //  await userIdBox.delete('UserId');

//  final userIdGet = userIdBox.get("userid"); // Retrieve the user ID using the key "userid"
//  log("${userIdGet.userid}");
//  log("Retrieved user ID from Hive: $userId");
//  return userIdGet;

//     // Navigate to the OtpGet widget, passing the user ID

//   } else {
//     log("Error: User ID is null");
//   }
// }
