import 'dart:developer';

import 'package:hive_flutter/adapters.dart';

Future<void> tokenStore(dynamic value) async {
  final tokens = await Hive.openBox("TokenData");
   


  log(" Token stored in token: $tokens");

  if (tokens.isEmpty || value != tokens.get('token')) {
    await tokens.clear();
    await tokens.put('token', value);
    log("Token stored: $value");
  } else {
    log("Token is already stored: ${tokens.get('token')}");
  }
}

Future<dynamic> tokenGet() async {
  final tokens = await Hive.openBox("TokenData");


  log(" hive:${tokens.values}");
  final tokenGet = await tokens.get('token');
  log(" hive::::::${tokenGet}");

  return tokenGet;
}
