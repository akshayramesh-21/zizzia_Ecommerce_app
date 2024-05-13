part of 'wishlist_bloc.dart';

 class WishlistState {}

 class WishlistInitial extends WishlistState {}

 class WishlistLoading extends WishlistState {}

 class WishlistLoaded extends WishlistState {

  final WishlistItems ?wishlistItems;

  WishlistLoaded( {this.wishlistItems});
  
 }
 class WishlistUpdated extends WishlistState {}
 class WishlistError extends WishlistState {}



