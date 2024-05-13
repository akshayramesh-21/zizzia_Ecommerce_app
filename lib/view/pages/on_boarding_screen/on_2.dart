
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/login/login1.dart';

class OnBoardPage2 extends StatelessWidget {
  const OnBoardPage2({super.key});

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
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Center(
              child: Image.asset(
                'assets/on11.png',
                width: 50.w,
              ),
            ),
            Center(
              child: Text(
                'Purchase Online',
                style: TextStyle(
                   fontFamily: 'eurofighter',
                 fontWeight: FontWeight.w300, fontSize: 22),
              ),
            ),
            Text(
              'Your one-step shop all your online',
              style: TextStyle(fontFamily: 'font1',
                fontSize: 14, color: Colors.blueGrey),
            ),
            Text(
              'shopping needs!',
              style: TextStyle(fontFamily: 'font1',
                fontSize: 14, color: Colors.blueGrey),
            ),
            SizedBox(
              height: 10,
            ),

            FloatingActionButton(
              onPressed: () {

                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => Login()), (Route route) => false);



                
              },
              backgroundColor: Color.fromARGB(255, 57, 34, 1),
              child: Icon(
                Icons.forward,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
