// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_out_bloc.dart';

 class CheckOutEvent {}

class AddressPostEvent extends CheckOutEvent {
final String ?name;
final String ?address;
final String ?city;
final String ?state;
final String ?pincode;
final String ?phone;
final BuildContext ?context;


  AddressPostEvent({
     this.name,
     this.address,
     this.city,
     this.state,
     this.pincode,
     this.phone,
     this.context,
  });

}



