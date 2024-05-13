part of 'cart_item_pass_bloc.dart';

@immutable
sealed class CartItemPassState {}

final class CartItemPassInitial extends CartItemPassState {}


class CartPostLoading extends CartItemPassState {}

class CartPostLoaded extends CartItemPassState {}
class CartPostError extends CartItemPassState {}

