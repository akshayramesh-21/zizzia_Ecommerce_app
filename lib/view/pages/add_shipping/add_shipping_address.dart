import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddShippingAdress extends StatelessWidget {
  const AddShippingAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Add shipping",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: Column(
        children: [
          Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "firstname",
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              TextField(
                decoration: InputDecoration(hintText: "lastname"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
