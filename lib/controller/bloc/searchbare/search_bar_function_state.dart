part of 'search_bar_function_bloc.dart';
 class SearchBarFunctionState {}

final class SearchBarFunctionInitial extends SearchBarFunctionState {}

class SearchBarFunctionLoading extends SearchBarFunctionState {}


class SearchBarFunctionLoaded extends SearchBarFunctionState {

final Searchitem searchitems;

  SearchBarFunctionLoaded({required this.searchitems});

}


class SearchBarFunctionError extends SearchBarFunctionState {}
