
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/favorite/ui_utilites.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height:30.h,
            ),
            Center(
              child: Container(
                child: Stack(
                  children: [
                    Image.asset(
                      favIcon,
                      width: 15.w,
                    ),
                  ],
                ),
              ),
            ),
          
            Center(
                child: Text(
              "You don't have any items",
              style:  TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'eurofighter',
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold)
            )),
            SizedBox(
              height: 30.h,
            ),
         
          ],
        ),
      ),
    );
  }
}
