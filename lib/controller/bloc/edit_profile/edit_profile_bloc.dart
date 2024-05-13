import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:zizzia_e_commerce/controller/functions/edit_user/editUser.dart';



part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
   

    on<EventSucess>((event, emit) {       final newProfile=  editWithImg(event.image as File, event.phoneno.toString(), event.name.toString(),);

      log('edit user bloc');
       log('${newProfile}');
      emit(Loading());

      emit( Loaded(statusCode: newProfile
   ));
      
      
    },);



  }
}
