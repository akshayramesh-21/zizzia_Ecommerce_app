import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:zizzia_e_commerce/controller/functions/profilePage/profile.dart';
import 'package:zizzia_e_commerce/model/profileView.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageInitial()) {
    on<ProflieSucess>((event, emit) async {
    final profilePageData = await ProfileApi().profilePageApi();

      try {
        
        emit(ProfilePageLoaded(list: profilePageData));
     
      } catch (e) {
        emit(ProfilePageError());
        log('$e');
      }
    });
  }
}
