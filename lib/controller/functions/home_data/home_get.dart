import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/homeModel.dart';



class HomeDataGet {
  Future<CategorizedProducts> homeDataGet() async {
    try {
      
      final token = await tokenGet();
      final uri = Uri.parse("http://${ip}:3000/flutter/fhome");

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // log('Response Status Code: ${response.statusCode}');
       log('Response Status Code: ${response.body}');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CategorizedProducts.fromJson(jsonData['categorizedProducts']);
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      log('Exception: $e', error: e, stackTrace: stackTrace);
      rethrow; // Rethrow the exception to propagate it tS the caller
    }
  } 
 




  




  
}
