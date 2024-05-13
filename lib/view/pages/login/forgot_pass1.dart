
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/otp_verfication/opt_verification.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset('assets/on2.png'),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Forgot Password",
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "Please enter your email or phone we will send\nthe verfication code to reset your password ",
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'enter your email or phone',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpVerfiy()));
                },
                child: Text(
                  'Send',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(1, 15.w),
                    backgroundColor: const Color.fromARGB(255, 23, 99, 230)),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              height: 2,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}
