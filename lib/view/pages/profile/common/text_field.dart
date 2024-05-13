import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class TextFieldCommon extends StatelessWidget {
  String data;
  final TextEditingController controller;
  String hintText;

  TextFieldCommon({super.key, required this.data, required this.hintText,required this.controller });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0, left: 8),
          child: Text(
            data,
            style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'font1',
                    color: Color.fromARGB(136, 57, 34, 1),
                    fontWeight: FontWeight.bold)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 6),
          child: Container(
            width: 90.w,
            height: 6.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blueGrey,
                )),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
              hintStyle: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'font1',
                    color: Color.fromARGB(136, 57, 34, 1),
                    fontWeight: FontWeight.w300),
                hintText: hintText,
                contentPadding: EdgeInsets.only(left: 12, bottom: 3)
              ),
              textAlign: TextAlign.start,
              
            ),
          ),
        )
      ],
    );
  }
}
