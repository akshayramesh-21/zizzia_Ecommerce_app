import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';


import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/orderhistroy.dart';

part 'order_histroy_event.dart';
part 'order_histroy_state.dart';

class OrderHistroyBloc extends Bloc<OrderHistroyEvent, OrderHistroyState> {
  OrderHistroyBloc() : super(OrderHistroyInitial()) {
    on<OrderFetch>((event, emit) async{
      final token = await tokenGet();
    emit(orderLoading());
   

       try {

        log('order histroy try inside');
       
        final response = await http.get(
          Uri.parse('http://$ip:3000/flutter/orders'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
   
        );

        if (response.statusCode == 200) {
          // final jsonBody = await json.decode(response.body);
          log('order histroy  ${response.body}');

        final List<dynamic> jsonList = jsonDecode(response.body)['order'];
        final List<OrderHistroyModel> orderHistory = jsonList
            .map((json) => OrderHistroyModel.fromJson(json as Map<String, dynamic>))
            .toList();
       

          log('order histroy ${orderHistory}');

          emit(orderLoaded(orderItems: orderHistory));
        }
      } catch (e) {log('$e');
        emit(orderError());
      }
   



    });
  }
}
