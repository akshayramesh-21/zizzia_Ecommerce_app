part of 'paginaton_refresh_bloc.dart';

 class PaginatonRefreshEvent {}

 class FetchPagination extends PaginatonRefreshEvent {
 final pageNo;
 var context;

  FetchPagination({this.context,required this.pageNo});
 }



 class RefreshPagination extends PaginatonRefreshEvent {
 var context;
 
 RefreshPagination({ this.context});
   
 }