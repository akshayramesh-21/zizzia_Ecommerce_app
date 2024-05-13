
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/login/login_bloc_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/login/login_bloc_event.dart';
import 'package:zizzia_e_commerce/controller/bloc/login/login_bloc_state.dart';
import 'package:zizzia_e_commerce/controller/functions/validator/email_validator.dart';
import 'package:zizzia_e_commerce/view/pages/create%20_account/create_acoount1.dart';
import 'package:zizzia_e_commerce/view/pages/login/forgot_pass1.dart';
import 'package:zizzia_e_commerce/view/widgets/bottom_nav.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBlocBloc, LoginBlocState>(
        listener: (context, state) {
          if (state.isSuccess) {


        
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => BottomNavBar()), (Route route) => false);

                                













      
          }
        },
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text("Log In",
                    style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'eurofighter',
                        color: Color.fromARGB(255, 57, 34, 1),
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 80.w,
                  height: 60.h,
                  child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
                    builder: (context, state) {
                      return ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 60.h,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                  )),
                              child: TextFormField(
                                validator: (value) => validateEmail(value),
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(left: 12, bottom: 3),
                                    hintText: 'Email or Phone',
                                    hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),),
                                    
                                    
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 60.h,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                  )),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),
                                    contentPadding:
                                        EdgeInsets.only(left: 12, bottom: 3)),
                                obscureText: true,
                              ),
                            ),
                          ),
                          if (state.isLoading)
                            Center(
                              child: SizedBox(
                                  height: 5.h,
                                  width: 10.w,
                                  child: ProgressIndicate()),
                            ),
                          BlocListener<LoginBlocBloc, LoginBlocState>(
                            listener: (context, state) {
                              if (state.isFailure) {
                                QuickAlert.show(
                                  confirmBtnColor:
                                      Color.fromARGB(115, 86, 224, 48),
                                  onCancelBtnTap: () {
                                    Navigator.pop(context);
                                  },
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: 'Oops...',
                                  text: 'Wrong password or email',
                                );
                              }
                            },
                            child: SizedBox(),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  BlocProvider.of<LoginBlocBloc>(context).add(
                                    LoginButtonPressed(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'font2',
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(90.w, 8.h),
                                  backgroundColor:
                                      Color.fromARGB(255, 57, 34, 1),
                                ),
                              )),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPass())),
                                child: Container(
                                  child: Text('Forget Password',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'font1',
                                          color: Color.fromARGB(255, 57, 34, 1),
                                          fontWeight: FontWeight.w300)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
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
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have any accounts? ", style: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateAccount()));
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.red,
                    
                    
                    fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
