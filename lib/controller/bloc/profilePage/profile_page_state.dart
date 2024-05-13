// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_page_bloc.dart';

@immutable
sealed class ProfilePageState {}

final class ProfilePageInitial extends ProfilePageState {}

class ProfilePageLoaded extends ProfilePageState {
  final Autogenerated list;

  ProfilePageLoaded({required this.list});
}

class ProfilePageError extends ProfilePageState {}
