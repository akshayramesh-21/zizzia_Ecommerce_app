import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PassSet extends StatelessWidget {
  const PassSet({super.key});

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
            Image.asset(
              'assets/SuccesIcon.png',
              width: 10.w,
              height: 10.h,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("New password has been set",
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
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Your password has been updated",
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Successfully",
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Home',
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
