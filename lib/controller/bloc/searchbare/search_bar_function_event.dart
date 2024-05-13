part of 'search_bar_function_bloc.dart';

 class SearchBarFunctionEvent {}

  class TextFieldChanges extends SearchBarFunctionEvent {

  final textData;
  TextFieldChanges( this.textData);


  }


