// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_item_pass_bloc.dart';
 class CartItemPassEvent {
  
 }


class CartPostSend extends CartItemPassEvent {
  String itemId;
  CartPostSend({
    required this.itemId,
  });

}

class CartValueAdd extends CartItemPassEvent{
  String add;
    final BuildContext context;
  CartValueAdd({required this.context,
    required this.add,
  });

}


class CartValueRemove extends CartItemPassEvent

{ String remove;
  final BuildContext context;
  CartValueRemove( {required this.context,
    required this.remove,
  });

    




}

class CartValueDelete extends CartItemPassEvent{
 String itemId;
  final BuildContext context;
  CartValueDelete({
    required this.context,
    required this.itemId,
  });

}

