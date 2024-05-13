import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:zizzia_e_commerce/controller/functions/home_data/home_get.dart';
import 'package:zizzia_e_commerce/model/homeModel.dart';

part 'home_data_get_event.dart';
part 'home_data_get_state.dart';

class HomeDataGetBloc extends Bloc<HomeDataGetEvent, HomeDataGetState> {
  HomeDataGetBloc() : super(loadingIntial()) {
    on<ItemStore>((event, emit) async {
      final homeData = await HomeDataGet().homeDataGet();
     

      try {
        emit(LoadedState(itemList: homeData));
         
         

     

      } catch (e) {
        emit(LoaderrorState());
        print(e);
      }
    });
  }
}
