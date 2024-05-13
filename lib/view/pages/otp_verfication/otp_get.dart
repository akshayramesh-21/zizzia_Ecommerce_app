
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'package:sizer/sizer.dart';

import 'package:pinput/pinput.dart';
import 'package:zizzia_e_commerce/controller/functions/otp_verify/otp_verify.dart';
import 'package:zizzia_e_commerce/view/pages/login/login.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class OtpGet extends StatelessWidget {
  final userid;

  OtpGet({super.key, this.userid});
  final pinController = TextEditingController();

  final focusNode = FocusNode();
  ValueNotifier <bool> verify=ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
          
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("OTP Verfication",
                style: TextStyle(
                  fontSize:26.sp,
                  fontFamily: 'eurofighter',
                  color: Color.fromARGB(255, 57, 34, 1),
                  fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                    "We will send you one_time password to your",
                   style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Color.fromARGB(136, 57, 34, 1),
                  fontWeight: FontWeight.w300)
                    
                    
                    ),
              ),
            ), Center(
              child: Text(
                      "mobile number",
                     style: TextStyle(
                    fontSize:16.sp,
                    fontFamily: 'font1',
                    color:Color.fromARGB(136, 57, 34, 1),
                    fontWeight: FontWeight.w300)
                      
                      
                      ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 10.h,
              child: Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  defaultPinTheme: PinTheme(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 168, 220, 214),
                          borderRadius: BorderRadius.circular(40))),
                  length: 6,
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  // defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 4),
                  // validator: (value) {

                  // },

                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 2.w,
                        height: 1.h,
                        color: Color.fromARGB(255, 248, 136, 7),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           ValueListenableBuilder(valueListenable: verify, builder: (context, value, child) {
             return  Padding(
              padding: const EdgeInsets.all(15.0),
              child:verify.value? ProgressIndicate(): ElevatedButton(
                onPressed: () async {
                  verify.value= await otpVerifyFunction(context, userid, pinController.text);
                  if (verify.value==true){
                     QuickAlert.show(
                                  confirmBtnColor:
                                      Color.fromARGB(115, 86, 224, 48),
                                  onCancelBtnTap: () {
                                    Navigator.pop(context);
                                  },
                                  context: context,
                                  type: QuickAlertType.success,
                                  title: 'Sucess',
                                  text: 'Account created sucessfully',
                                );


                  }
                  else{ QuickAlert.show(
                                  confirmBtnColor:
                                      Color.fromARGB(115, 86, 224, 48),
                                  onCancelBtnTap: () {
                                    Navigator.pop(context);
                                  },
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: 'Error',
                                  text: 'Try again Wrong otp',
                                );



                  }
                  



                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                },
                child:Text(
                  'Verify',
                  style: TextStyle(
                    fontSize:16.sp,
                    fontFamily: 'font1',
                    color:Colors.white,
                    fontWeight: FontWeight.bold)
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(1, 10.w),
                    backgroundColor: Color.fromARGB(255, 57, 34, 1)),
              ),
            );
           },),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Back to ",style: TextStyle(
                    fontSize:14.sp,
                    fontFamily: 'font1',
                    color:Color.fromARGB(136, 57, 34, 1),
                    fontWeight: FontWeight.bold),) , 
                  
                  
                  InkWell(
                    onTap: () {
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                      
                    },
                    
                    child: Text("Login",style: TextStyle(
                    fontSize:15.sp,
                    fontFamily: 'font1',
                    color:Colors.red,
                    fontWeight: FontWeight.bold) ))
                ],
              )
          ],
        ),
      ),
    );
  }
}
