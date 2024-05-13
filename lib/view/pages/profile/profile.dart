
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/profilePage/profile_page_bloc.dart';
import 'package:zizzia_e_commerce/controller/functions/logout/logout.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/Policy/policy.dart';
import 'package:zizzia_e_commerce/view/pages/Settings/settings.dart';
import 'package:zizzia_e_commerce/view/pages/aboutus/aboutus.dart';
import 'package:zizzia_e_commerce/view/pages/order/order.dart';
import 'package:zizzia_e_commerce/view/pages/profile/common/profileList.dart';
import 'package:zizzia_e_commerce/view/pages/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfilePageBloc>(context).add(ProflieSucess());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            BlocBuilder<ProfilePageBloc, ProfilePageState>(
              builder: (context, state) {
                if (state is ProfilePageLoaded) {
                  return Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            BlocBuilder<ProfilePageBloc, ProfilePageState>(
                              builder: (context, state) {
                                if (state is ProfilePageLoaded) {
                                  return CircleAvatar(
                                    radius: 15.w,
                                    backgroundImage: NetworkImage(
                                        'http://$ip:3000/products-images/${state.list.data!.image}'),
                                  );
                                } else {
                                  return Image.asset("assets/on3.png");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(
                        state.list.data?.name ?? "Username".toString(),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font1"),
                      ),
                      Text(
                        state.list.data!.email ?? "email".toString(),
                        style:
                            TextStyle(color: Color.fromARGB(255, 104, 99, 99)),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 95.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.black)),
              child: Column(
                children: [
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile())),
                      child: ProfileListCommon(
                          icon: Icons.man, dataName: "Edit Profile")),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OrderPage()));
                    },
                    child: ProfileListCommon(
                        icon: Icons.shopping_cart, dataName: " My Orders"),
                  ),
                  Divider(),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AboutUs()));
                      },
                      child: ProfileListCommon(
                          icon: Icons.note, dataName: 'About US')),
                  Divider(),
                  ProfileListCommon(
                      icon: Icons.location_on, dataName: 'Our branches'),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 95.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.black)),
              child: Column(
                children: [
                  ProfileListCommon(
                      icon: Icons.chat_bubble,
                      dataName: "Frequently asked questions"),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PolicyPage()));
                    },
                    child: ProfileListCommon(
                        icon: Icons.shopping_cart, dataName: " Privacy Policy"),
                  ),
                  Divider(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      },
                      child: ProfileListCommon(
                          icon: Icons.note, dataName: 'Settings')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  logoOutFunction(context);
                },
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(90.w, 8.h),
                    backgroundColor: Color.fromARGB(102, 57, 34, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
