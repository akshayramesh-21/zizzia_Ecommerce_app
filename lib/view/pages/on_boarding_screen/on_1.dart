
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/on_boarding_screen/on_2.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

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
      body: Expanded(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
       
          children: [
            
            Center(
              child: Image.asset(
                "assets/Charco Mobile Life.png",
                width: 60.w,
              ),
            ),
            Center(
              child: Text(
                'Secure Transactions',
                style: TextStyle( fontFamily: 'eurofighter',   fontWeight: FontWeight.w300, fontSize: 22),
              ),
            ),
            Center(
              child: Text(
                'We use trusted payment gateways to',
                style: TextStyle( fontFamily: 'font1',fontSize: 14, color: Colors.blueGrey),
              ),
            ),
            Center(
              child: Text(
                'protect your finacial information',
                style: TextStyle( fontFamily: 'font1',fontSize: 14, color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            FloatingActionButton(
              onPressed: () {
                

               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => OnBoardPage2()), (Route route) => false);


          
              },
              backgroundColor:Color.fromARGB(255, 57, 34, 1),
              child: Icon(
                Icons.forward,
                color: Colors.white,
              ),
            )

            //
          ],
        ),
      ),
    );
  }
}
