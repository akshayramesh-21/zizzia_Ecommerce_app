
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/invoiceDownload/invoice_download_bloc.dart';
import 'package:zizzia_e_commerce/view/widgets/bottom_nav.dart';

class PaymentSucess extends StatefulWidget {
  final String orderId;
  PaymentSucess({super.key, required this.orderId});

  @override
  State<PaymentSucess> createState() => _PaymentSucessState();
}

class _PaymentSucessState extends State<PaymentSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              height: 20.h,
              width: 40.w,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/invoice.png'))),
            ),
          ),
          Center(
            child: Text(
              "Payment Successful ✅",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Color.fromARGB(136, 57, 34, 1),
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
       InkWell(onTap: (){

        BlocProvider.of<InvoiceDownloadBloc>(context).add(InvoiceDownload(orderid: widget.orderId));
       


        




       },
         child: Column(children: [
             Text(
              "Download an Invoice",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Center(
              child: Container(
                height: 5.h,
                width: 20.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/downloadinvo.gif'),
                )),
              ),
            ),
         ],),
       ),
          SizedBox(
            height: 8.h,
          ),
          IconButton.filled(
            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));},
            icon: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 255, 255, 255),
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
