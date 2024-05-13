import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewPass extends StatelessWidget {
  const NewPass({super.key});

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
              child: Text("Please enter a new password for your account",
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'enter your new password',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'repeat your new password',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Set Password',
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
