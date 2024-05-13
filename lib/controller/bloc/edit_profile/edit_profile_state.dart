part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

class Loading extends EditProfileState{}

class Loaded extends EditProfileState{

  
 final  statusCode;

  Loaded({this.statusCode});
  
}

class Error extends EditProfileState{}
