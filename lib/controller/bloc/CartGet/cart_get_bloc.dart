import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/cart_get.dart';

part 'cart_get_event.dart';
part 'cart_get_state.dart';

class CartGetBloc extends Bloc<CartGetEvent, CartGetState> {
  CartGetBloc() : super(CartGetInitial()) {
    on<CartFetch>((event, emit) async {
      emit(CartLoading());

      try {
        final token = await tokenGet();
        final response =
            await http.get(Uri.parse('http://$ip:3000/flutter/cart'), headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        });

        if (response.statusCode == 200) {
          log("Cart ${response.statusCode}");
         log("Cart ${response.body}");
      log("message");
          final  responseData = json.decode(response.body);

          final cartitem = CartGet.fromJson(responseData);
log('${cartitem}');


        
        






             

          log("----------===========${cartitem}");

          emit(CartLoaded(cartItems: cartitem));
        }
      } catch (e) {
        emit(CartError());
      }

      // TODO: implement event handler
    });




    
  }
}
