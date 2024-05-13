// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

class WishlistEvent {}

class WishListFetch extends WishlistEvent {


}

class WishListAdd extends WishlistEvent{
  final context;
  String id;
  WishListAdd({
    required this.id,  required this.context,
  });

}

// class WishListDelete extends WishlistEvent{



//   String id;
//   WishListDelete({
//     required this.id,
//   });

  
// }
