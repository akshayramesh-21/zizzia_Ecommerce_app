// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_data_get_bloc.dart';

@immutable
sealed class HomeDataGetState {}

final class HomeDataGetInitial extends HomeDataGetState {}

class loadingIntial extends HomeDataGetState {}

class LoadedState extends HomeDataGetState {
  final CategorizedProducts itemList;
  LoadedState({
    required this.itemList,
  });
}

class LoaderrorState extends HomeDataGetState {}
