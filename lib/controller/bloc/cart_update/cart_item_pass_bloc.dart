import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart ' as http;
import 'package:meta/meta.dart';
import 'package:zizzia_e_commerce/controller/bloc/CartGet/cart_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';

part 'cart_item_pass_event.dart';
part 'cart_item_pass_state.dart';

class CartItemPassBloc extends Bloc<CartItemPassEvent, CartItemPassState> {
  CartItemPassBloc() : super(CartItemPassInitial()) {

    
    on<CartPostSend>((event, emit) async {
      emit(CartPostLoading());

      try {
        final token = await tokenGet();
        String uri = 'http://$ip:3000/flutter/cart/${event.itemId}';

        final response = await http.get(Uri.parse(uri), headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        });

        if (response.statusCode == 200) {
          log("${response.statusCode}");
          log("${response.body}");
        }
      } catch (e) {
        emit(CartPostError());
      }
    });

    on<CartValueDelete>(((event, emit) async {
      log("deleteeeeeeeeeeeeeeeeeeeee  id${event.itemId}");

      try {
        final token = await tokenGet();

        final response = await http.get(
            Uri.parse('http://$ip:3000/flutter/cart/delete/${event.itemId}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            });
        if (response.statusCode == 200) {

          log(' delete json${response.body}');
          BlocProvider.of<CartGetBloc>(event.context).add(CartFetch());
        }
      } catch (e) {
        print(e);
      }
    }));

    on<CartValueAdd>((event, emit) async {
      try {
        final token = await tokenGet();
        final response = await http.get(
            Uri.parse('http://$ip:3000/flutter/cart/quantityadd/${event.add}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            });

        if (response.statusCode == 200) {
          BlocProvider.of<CartGetBloc>(event.context).add(CartFetch());
        }
      } catch (e) {}
    });

    on<CartValueRemove>((event, emit) async {
      try {
        final token = await tokenGet();
        final response = await http.get(
            Uri.parse(
                'http://$ip:3000/flutter/cart/quantityminus/${event.remove}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            });

        if (response.statusCode == 200) {
          BlocProvider.of<CartGetBloc>(event.context).add(CartFetch());
        }
      } catch (e) {}
    });
  }
}
