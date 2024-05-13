part of 'cart_get_bloc.dart';

@immutable
sealed class CartGetState {}

final class CartGetInitial extends CartGetState {}

class CartLoading extends CartGetState {}

class CartLoaded extends CartGetState {
  final CartGet cartItems;
  

  CartLoaded({required this.cartItems});
  
}


class CartError extends CartGetState {}
