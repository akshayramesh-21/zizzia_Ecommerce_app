import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileListCommon extends StatelessWidget {
  IconData icon;

  String dataName;

  ProfileListCommon({super.key, required this.icon, required this.dataName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 6.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(icon)),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        dataName,
                        style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'font1',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
