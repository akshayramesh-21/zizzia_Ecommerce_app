
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/Settings/common/switch_button.dart';
import 'package:zizzia_e_commerce/view/pages/profile/common/profileList.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 95.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 195, 189, 189))),
                  child: Column(children: [
                    ProfileListCommon(
                        icon: Icons.language, dataName: "Language"),
                    Divider(),
                    ProfileListCommon(icon: Icons.public, dataName: " Country"),
                    Divider(),
                    SwitchButtonCommon(
                      dataName: "Dark Mode",
                      icon: Icons.dark_mode,
                    ),
                    Divider(),
                    SwitchButtonCommon(
                      dataName: "Notification",
                      icon: Icons.notifications,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Sign Out',
                          style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'font1',
                    color:Colors.white,
                    fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(90.w, 8.h),
                        backgroundColor:
                            Color.fromARGB(102, 57, 34, 1)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
