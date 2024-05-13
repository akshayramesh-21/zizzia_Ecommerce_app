import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/functions/sign_up/sign_up.dart';
import 'package:zizzia_e_commerce/controller/functions/validator/email_validator.dart';
import 'package:zizzia_e_commerce/controller/functions/validator/pass_match.dart';
import 'package:zizzia_e_commerce/controller/functions/validator/password_length.dart';
import 'package:zizzia_e_commerce/controller/functions/validator/phone.dart';
import 'package:zizzia_e_commerce/view/pages/login/login.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ValueNotifier <bool> signUpBool=ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Center(
              child: Text("Register",
                  style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'eurofighter',
                      color: Color.fromARGB(255, 57, 34, 1),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: 80.w,
                height: 70.h,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 15),
                      child: Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1)),
                        child: TextFormField(
                          textAlign: TextAlign.justify,
                          controller: name,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 12, bottom: 3),
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),
                            
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 15),
                      child: Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1)),
                        child: TextFormField(
                          textAlign: TextAlign.justify,
                          validator: (value) => validateEmail(value),
                          controller: email,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 12, bottom: 3),
                              border: InputBorder.none,
                              hintText: 'Email',hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 15),
                      child: Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1)),
                        child: TextFormField(
                          textAlign: TextAlign.justify,
                          validator: (value) => validatePhone(phone.text),
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 12, bottom: 3),
                            border: InputBorder.none,
                            hintText: 'Phone',
                            hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 15),
                      child: Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1)),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) => validatePassword(value!),
                          controller: password,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 12, bottom: 3),
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 12),
                      child: Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1)),
                        child: TextFormField(
                          textAlign: TextAlign.justify,
                          validator: (value) => validateConfirmPassword(
                              password.text, confirmPass.text),
                          controller: confirmPass,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 12, bottom: 3),
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              hintStyle:TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),

                    ValueListenableBuilder(valueListenable: signUpBool, builder:
                    (context, value, child) {
                      return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          signUpBool.value=true;
                          if (_formKey.currentState!.validate()) {
                            final phone1 = await int.parse(phone.text);

                             signUpBool.value = await signUpFunction(context,
                                name.text, email.text, phone1, password.text);

                            log("$signUpBool");

                            if (signUpBool.value == false) {
                              QuickAlert.show(
                                confirmBtnColor:
                                    Color.fromARGB(115, 86, 224, 48),
                                onCancelBtnTap: () {
                                  Navigator.pop(context);
                                },
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Error',
                                text: 'Email already exist',
                              );
                            }
                          }
                        },
                        child:signUpBool.value==true? ProgressIndicate(): Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'font2',
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90.w, 8.h),
                          backgroundColor: Color.fromARGB(255, 57, 34, 1),
                        ),
                      ),
                    );
                      
                    },),
                    



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: .2.h,
                            color: Colors.grey.withOpacity(.5),
                          ),
                        ),
                        Text(" OR "),
                        Expanded(
                          child: Container(
                            height: .2.h,
                            color: Colors.grey.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/googleicon.png',
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/appleIcon.png',
                              width: 40,
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/fbicon1.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do you have accounts? ", style: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.red,
                    
                    fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
