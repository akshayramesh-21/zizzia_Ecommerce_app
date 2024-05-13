import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/payment/sucessPage.dart';

part 'razon_payment_event.dart';
part 'razon_payment_state.dart';

class RazonPaymentBloc extends Bloc<RazonPaymentEvent, RazonPaymentState> {
  RazonPaymentBloc() : super(RazonPaymentInitial()) {
    on<RazonPaymentSuccess>((event, emit) async {
      
      try {
       
        Razorpay razorpay = await Razorpay();
        log("razon intial data send");

        var options = {
          'key': 'rzp_test_pJw1K1QJDp192x',
          'amount': event.amt,
          'name': 'Rasshopping',
          'order_id': event.id,
          'description': 'Fine T-Shirt',
          'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
        };

        razorpay.open(options);

        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (error) {
          emit(RazonPaymentError());
          log('razon payment side error$error');
        });

  
  
  
   razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
            (PaymentSuccessResponse success) async {
         
 log('razon payment side success${success.data}');
   
           
           
          BlocProvider.of<RazonPaymentBloc>(event.context).add(RazonValidate(
             context: event.context,
            siteOderId:  event.receiptid,
            Order: success.orderId.toString(),
            PaymentId: success.paymentId.toString(),
            signature: success.signature.toString(),
          ));

        
          
          emit(RazonPaymentLoaded());

        });

        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (wallet) {
         log('razon payment side wallet$wallet');
          emit(RazonPaymentWallet());
        });
      } catch (e) {
        log('eeeeeeeeeee$e');
      }
    });




    on<RazonValidate>(((event, emit) async {
      emit(RazonPaymentloding());
log("RazonValidate event inside");
       
      try {log("RazonValidate event inside try");
        final token = await tokenGet();
        log(token);
            log('payid ${event.PaymentId}');
            log('orid ${event.Order}');
            log('signatureid ${event.signature}');
            log('siteOderId ${event.siteOderId}');


        final response = await http.post(Uri.parse("http://${ip}:3000/flutter/verifypayment"), headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        }, 
        body: {
          'paymentId': event.PaymentId,
          'orderId': event.Order,
         'signature': event.signature,
          'orderID':event.siteOderId
        });

        log("Payment success from server side${response.statusCode}");
        log("Payment success from server side${response.body}");
        if (response.statusCode == 200) {
          log("#####Payment success from server side #########");
          Map<String, dynamic> responseBody = json.decode(response.body);
           emit(RazonPaymentLoaded());
            
          if(responseBody["success"] == "Payment Success"){
            
            
log("#####Payment success cart in Empty#########");
           Navigator.push(event.context, MaterialPageRoute(builder: (context)=>PaymentSucess(orderId: event.siteOderId,)));

               Navigator.of(event.context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => PaymentSucess(orderId: event.siteOderId,)), (Route route) => false);



           
           emit( RazonPaymentConfirmed())
;          }

         
        }

// Emit loaded state with data
      } catch (e) {
        emit(RazonPaymentError());
        // Emit error state if fetching data fails
      }
    }));
  }


}
