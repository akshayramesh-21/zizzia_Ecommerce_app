// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'razon_payment_bloc.dart';

 class RazonPaymentEvent {}
 


 class RazonPaymentSuccess extends RazonPaymentEvent {
  final context;
  final int amt;
  final String id;
  final String receiptid;

  RazonPaymentSuccess({ required this.context ,required this.amt, required this.id,required this.receiptid});

 }

class RazonValidate extends RazonPaymentEvent {
    final context;
  String signature;
  String PaymentId;
  String  Order;
  String siteOderId;
  RazonValidate( {required this.context,
    required this.signature,
    required this.PaymentId,
    required this.Order,
    required this.siteOderId,
  });


 }

 
