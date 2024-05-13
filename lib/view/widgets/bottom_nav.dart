
import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:zizzia_e_commerce/view/pages/catagories/catagort.dart';
import 'package:zizzia_e_commerce/view/pages/favorite/favorite.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/home_screen.dart';
import 'package:zizzia_e_commerce/view/pages/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final ValueNotifier<int> currentIndexx = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndexx,
        builder: (context, value, child) {
          return IndexedStack(
            index: value,
            children: [ CatagoryPage(),
              HomePage(),
              FavoritePage(),
              
             
              ProfilePage(),
             
            ],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndexx,
        builder: (context, value, child) {
          return SalomonBottomBar(
            backgroundColor: Colors.white,
            currentIndex: value,
            onTap: (i) {
              currentIndexx.value = i;
            },
            items: [

              SalomonBottomBarItem(
                icon: Icon(Icons.category_sharp),
                title: Text("Category", style: TextStyle(
                    
                    fontFamily: 'font1',
                    color:Colors.black,
                    fontWeight: FontWeight.bold),),
                selectedColor: Colors.teal,
              ),
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home", style: TextStyle(
                    
                    fontFamily: 'font1',
                    color:Colors.black,
                    fontWeight: FontWeight.bold)),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Likes", style: TextStyle(
                    
                    fontFamily: 'font1',
                    color:Colors.black,
                    fontWeight: FontWeight.bold)),
                selectedColor: Colors.pink,
              ),
    
              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile", style: TextStyle(
                    
                    fontFamily: 'font1',
                    color:Colors.black,
                    fontWeight: FontWeight.bold)),
                selectedColor: Colors.teal,
              ),

              

            
            ],
          );
        },
      ),
    );
  }
}


