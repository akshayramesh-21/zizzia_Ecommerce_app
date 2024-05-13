
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/otp_verfication/otp_get.dart';

class OtpVerfiy extends StatelessWidget {
  const OtpVerfiy({super.key});

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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("OTP Verfication",
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "We will send you one_time password to you email",
                    style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.red,
                    
                    fontWeight: FontWeight.bold)
                    ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Phone'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpGet()));
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
            Center(
              child: Container(
                width: 100,
                child: Row(
                  children: [
                    Text(
                      "Back to",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '  Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 23, 99, 230)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
