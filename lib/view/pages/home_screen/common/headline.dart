import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Headline extends StatelessWidget {
  String? dealine;
   Headline({super.key ,required this.dealine});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   dealine.toString(),
                    style: TextStyle(fontSize: 6.w, fontWeight: FontWeight.w500,fontFamily: "font2"),
                  ),
               
                ],
              ),
            ),
       
      ],
    );
       
  }
}