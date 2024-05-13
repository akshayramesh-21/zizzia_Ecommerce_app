import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/allProduct.dart';
part 'paginaton_refresh_event.dart';
part 'paginaton_refresh_state.dart';

class PaginatonRefreshBloc
    extends Bloc<PaginatonRefreshEvent, PaginatonRefreshState> {
  ScrollController scrollControl= ScrollController();



  PaginatonRefreshBloc() : super(PaginatonRefreshInitial()) {
   

    on<FetchPagination>((event, emit) async {
      emit(LoadingPagination());

      try {
        final token = await tokenGet();
        log("pagination Api inside");

        final response = await http.get(
            Uri.parse('http://$ip:3000/flutter/allproducts/${event.pageNo}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            });

        if (response.statusCode == 200) {
          log("Pagination Api sucess ${response.body}");
       final responseData = json.decode(response.body);
        // final productData = (responseData as List<dynamic>)
        //     .map((item) => ProductAllData.fromJson(item))
        //     .toList();
          final productAllData = MainAllProduct.fromJson(responseData);
           
          MainAllProduct totalitem = MainAllProduct(product: []);

      
          totalitem.product!.addAll(productAllData.product!);
           emit (LoadedPagination(
           allProduct: productAllData,
         
      
         
        ));





     
              
             

        }
      } catch (e) {log('pagination catch $e');}
    });

  ;
  }
}



  