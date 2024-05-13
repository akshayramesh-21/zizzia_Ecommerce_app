
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            height: 50.h,
            child: Image.asset(
              'assets/notification.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "No Notifications",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text("You have no notifications yet.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Text(
            'Please come back soon',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
