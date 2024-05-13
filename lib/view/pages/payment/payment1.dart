import 'dart:developer';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/checkout/check_out_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/razonpay/razon_payment_bloc.dart';
import 'package:zizzia_e_commerce/view/pages/payment/indicator.dart';

class PaymentStart extends StatefulWidget {
  const PaymentStart({Key? key}) : super(key: key);

  @override
  State<PaymentStart> createState() => _PaymentStartState();
}

class _PaymentStartState extends State<PaymentStart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap the button for confirm',style: TextStyle(
                fontSize: 16,
                    
                    fontFamily: 'font1',
                    
                   
                    
                    fontWeight: FontWeight.bold),
            ),
            BlocBuilder<CheckOutBloc, CheckOutState>(
              builder: (context, state) {
                log("message");

                if (state is AddressPostLoaded) {
                  log("message1 ${state.paymentmodel.order.amount}");
                  return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                    onPressed: () async {
                      BlocProvider.of<RazonPaymentBloc>(context).add( await
                          RazonPaymentSuccess( 
                              receiptid: state.paymentmodel.order.receipt,
                              context: context,
                              amt: state.paymentmodel.order.amount,
                              id: state.paymentmodel.order.id));

//                               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
// builder: (context) =>  IndicatorPage()), (Route route) => false);

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>IndicatorPage()));


                              
                    },
                    child: Text("Pay ", style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.white,
                    fontSize: 16.sp,
                    
                    fontWeight: FontWeight.bold),),
                  );
                } else {
                  return Container(
                    color: Color.fromARGB(255, 193, 210, 13),
                  );
                }
              },
            ),





          ],
        ),
      ),
    );
  }
}
