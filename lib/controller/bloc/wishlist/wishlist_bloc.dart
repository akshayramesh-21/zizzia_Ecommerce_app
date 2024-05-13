import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/wishlist.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {


    on<WishListFetch>((event, emit) async {
      emit(WishlistLoading());

      try {
        final token = await tokenGet();
        final response = await http
            .get(Uri.parse('http://$ip:3000/flutter/wishlist'), headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        });

        if (response.statusCode == 200) {
          log("Wishlist add fetch **********************************");
          log("${response.body}");
          final jsonrespone = await json.decode(response.body);

          final wishitems = await WishlistItems.fromJson(jsonrespone);
          log("$wishitems");

          emit(WishlistLoaded(wishlistItems: wishitems));
        }
      } catch (e) {
        emit(WishlistError());
      }
    });



    on<WishListAdd>((event, emit) async {
      emit(WishlistLoading());

      log("Wishlist add suc ***********WishlistLoading**********************");

      try {
        log("Wishlist add suc ***********try**********************");
        final token = await tokenGet();
        final response = await http.get(
            Uri.parse('http://$ip:3000/flutter/wishlist/${event.id}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            });

        if (response.statusCode == 200) {
          log("Wishlist add suc ****************context******************${event.context}");
          
          add(WishListFetch());

       

          log("Wishlist add suc ************body**********************${response.body}");
        }
      } catch (e) {
        emit(WishlistError());
      }
    });
  }
}
