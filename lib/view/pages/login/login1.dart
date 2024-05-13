
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/create%20_account/create_acoount1.dart';
import 'package:zizzia_e_commerce/view/pages/login/login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Zizza",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "CREATE YOUR",
            style: TextStyle(
                fontSize: 34,
                fontFamily: 'eurofighter',
                color: Color.fromARGB(255, 57, 34, 1),
                fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "OWN STYLE",
            style: TextStyle(
                fontSize: 34,
                fontFamily: 'eurofighter',
                color: Color.fromARGB(255, 57, 34, 1),
                fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "Make your own style with us and make",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'font1',
                color: Color.fromARGB(136, 57, 34, 1),
                fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "yourself on fire",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'font1',
                color: Color.fromARGB(136, 57, 34, 1),
                fontWeight: FontWeight.bold),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(onTap: (){

              },
                child: InkWell(
                   onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                          },



                  child: Container(
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle( fontFamily: 'font1',
                          color: Color.fromARGB(255, 57, 34, 1),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    )),
                    height: 8.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white, width: 2),
                      color: Color.fromARGB(34, 192, 174, 150),
                    ),
                  ),
                ),
              ),
              InkWell(

                 onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },


                
                child: Container(
                  child: Center(
                      child: Text(
                    "Log In",
                    style: TextStyle( fontFamily: 'font1',
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  )),
                  height: 8.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 57, 34, 1)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Stack(
            children: [
              Center(
                child: Container(
                    height: 53.3.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(246, 231, 229, 225),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(140),
                        topRight: Radius.circular(140),
                      ),
                    )),
              ),
              Center(
                child: Container(
                  height: 53.3.h,
                  width: 100.w,
                  child: Image.asset(
                    'assets/5.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 35.h,
                left: -12.w,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(15 / 360),
                  child: Container(
                    width: 100.h,
                    height: 6.h,
                    color: Color.fromRGBO(213, 211, 203, 1).withOpacity(.8),
                    child: Row(children: [
                      Text(
                        "   NEW COLLECTIONS ",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'eurofighter',
                            color: Color.fromARGB(255, 57, 34, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.red,
                      ),
                      Text(
                        "  NEW COLLECTIONS ",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'eurofighter',
                            color: Color.fromARGB(255, 57, 34, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
