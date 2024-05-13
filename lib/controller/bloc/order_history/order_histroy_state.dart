part of 'order_histroy_bloc.dart';

class OrderHistroyState {}

 class OrderHistroyInitial extends OrderHistroyState {}

 class orderLoading extends OrderHistroyState {}

  class orderLoaded extends OrderHistroyState {

    final List<OrderHistroyModel> orderItems;

  orderLoaded({required this.orderItems});



  }

   class orderError extends OrderHistroyState {}


