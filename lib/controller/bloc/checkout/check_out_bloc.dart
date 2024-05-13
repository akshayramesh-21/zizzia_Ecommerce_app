import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/payment.dart';

part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  CheckOutBloc() : super(CheckOutInitial()) {
    on<AddressPostEvent>((event, emit) async {
      emit(AddressPostLoading());

      log("razon post  bloc");

      try {  
          log("razon post  bloc try inside");

        final token = await tokenGet();
        final response = await http.post(
          Uri.parse('http://$ip:3000/flutter/placeorder'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: {
            'name': event.name,
            'address': event.address,
            'city': event.city,
            'state': event.state,
            'pincode': event.pincode,
            'phoneno': event.phone,
            'paymentMethod': "razorpay"
          },
        );

        if (response.statusCode == 200) {
          final jsonBody = await json.decode(response.body);
          log("razon post  bloc 200 inside ${response.body}");

          // Map<String, dynamic> jsonBody =await jsonDecode(response.body);
          PaymentModel paymentData =  PaymentModel.fromJson(jsonBody);
          log('********${jsonBody.containsKey('id')}');

          log('razon post|******* ${paymentData.order.amountPaid}');

          emit(AddressPostLoaded(paymentmodel: paymentData));
        }
      } catch (e) {

        log(e.toString());
        emit(AddressPostError());
      }
    });
  }
}
