part of 'check_out_bloc.dart';

class CheckOutState {}

 class CheckOutInitial extends CheckOutState {}

 class AddressPostLoading extends CheckOutState {}

  class AddressPostLoaded extends CheckOutState {

    final PaymentModel paymentmodel;

  AddressPostLoaded({required this.paymentmodel});
    

  


  }

   class AddressPostError extends CheckOutState {}





