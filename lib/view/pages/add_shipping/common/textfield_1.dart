import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextField1 extends StatelessWidget {
  String lastname;

  String firstname;

  TextField1({super.key, required this.firstname, required this.lastname});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 5.h,
      child: Row(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: firstname,
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(hintText: lastname),
            ),
          ),
        ],
      ),
    );
  }
}
