import 'dart:convert';

import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/banner.dart';
part 'banner_event.dart';
part 'banner_state.dart';

//
class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    on<BannerSuccess>((event, emit) async {
      try {
        final token = await tokenGet();
        final uri = Uri.parse("http://${ip}:3000/flutter/banner");

        final response = await http.get(
          uri,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        if (response.statusCode == 200) {
          final List<dynamic> responseData =
              json.decode(response.body)['banner'];
          final bannerItems =
              responseData.map((item) => BannerClass.fromJson(item)).toList();
          emit(BannerLoaded(bannerItems));
        }

// Emit loaded state with data
      } catch (e) {
        emit(ErrorState(
            message:
                'Failed to load banners')); // Emit error state if fetching data fails
      }
    });
  }
}
