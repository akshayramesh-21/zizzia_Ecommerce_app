// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_profile_bloc.dart';

 class EditProfileEvent {}

class EventSucess extends EditProfileEvent {
 String? name;
 String? phoneno;
 XFile?image;
  EventSucess({
     this.name,
    this.phoneno,
     this.image,
  });

}
