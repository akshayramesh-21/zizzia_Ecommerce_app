

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/checkout/check_out_bloc.dart';
import 'package:zizzia_e_commerce/view/pages/checkout/textfield.dart';
import 'package:zizzia_e_commerce/view/pages/payment/payment1.dart';

class AddressPost extends StatefulWidget {
  const AddressPost({super.key});

  @override
  State<AddressPost> createState() => _AddressPostState();
}

class _AddressPostState extends State<AddressPost> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Checkout",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
                color: Color.fromARGB(31, 96, 125, 139),
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                border: Border.all(color: Colors.black26)),
            child: ListView(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                texttt('Name'),
                Expanded(
                    child: TextFieldWidget(
                      
                  hh: 5,
                  hintTextt: "Name",
                  textController: namecontroller,
                )),


                texttt('Address'),
                Expanded(
                    child: TextFieldWidget(
                  hh: 5,
                  hintTextt: "Address",
                  textController: addresscontroller,
                )),



                texttt('City'),
                TextFieldWidget(
                  hh: 5,
                  hintTextt: "City",
                  textController: citycontroller,
                ),
                texttt('State'),
                TextFieldWidget(
                  hh: 5,
                  hintTextt: "State",
                  textController: statecontroller,
                ),
                texttt('Pincode'),
                TextFieldWidget1(
                  hh: 5,
                  hintTextt: "Pincode",
                  textController: pincodecontroller,
                ),
                texttt('Phone'),
                TextFieldWidget1(
                  hh: 5,
                  hintTextt: "Phone",
                  textController: phonecontroller,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 35),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(120, 121, 164, 234)),
                      onPressed: () async {
                        BlocProvider.of<CheckOutBloc>(context).add(
                            AddressPostEvent(
                                context: context,
                                address: addresscontroller.text,
                                city: citycontroller.text,
                                name: namecontroller.text,
                                phone: phonecontroller.text,
                                pincode: pincodecontroller.text,
                                state: statecontroller.text));


                                
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) =>  PaymentStart()), (Route route) => false);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PaymentStart()));
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.white,
                    fontSize: 16.sp,
                    
                    fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  Padding texttt(String data) => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(
          "$data:",
          style: TextStyle(
                    
                    fontFamily: 'font1',
                   
                    fontSize: 16.sp,
                    
                    fontWeight: FontWeight.bold),
        ),
      );
}
