part of 'paginaton_refresh_bloc.dart';

 class PaginatonRefreshState {}

 class PaginatonRefreshInitial extends PaginatonRefreshState {}
 class LoadingPagination extends PaginatonRefreshState {}

 class LoadedPagination extends PaginatonRefreshState {
 final MainAllProduct allProduct;
 
  // final List<ProductAllData> productsOnly;

   LoadedPagination({
required this.allProduct,
    // required this.productsOnly,
  });

  
    
  //   

 }

 class paginationError extends PaginatonRefreshState {}