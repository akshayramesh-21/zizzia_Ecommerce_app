

import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/searchitem.dart';
part 'search_bar_function_event.dart';
part 'search_bar_function_state.dart';

class SearchBarFunctionBloc extends Bloc<SearchBarFunctionEvent, SearchBarFunctionState> {


  SearchBarFunctionBloc() : super(SearchBarFunctionInitial()) {
    on<TextFieldChanges>((event, emit) async {
    
     final query=await event.textData;
     
     if(query==''){
      emit(SearchBarFunctionLoading());

     }
     else{

      try{
         final token = await tokenGet();
          log("sreach Api inside");

        final response =  await http.get(
            Uri.parse('http://$ip:3000/flutter/products/search?query=${event.textData}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            });


            if(response.statusCode==200){
              log("sreach Api sucess ${response.body}");

              final jsondata= json.decode(response.body);

              final getdata= Searchitem.fromJson(jsondata['searchitems']);
              emit(SearchBarFunctionLoaded(searchitems:getdata ));

            }
      

      }
          
          catch(e){}


     }





      // TODO: implement event handler
    });
  }
}
