import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeadMenu extends StatelessWidget {
  List<String> headmenu;

  HeadMenu({super.key, required this.headmenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: 100.w,
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: headmenu.length,
            itemBuilder: (build, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 6.0, top: 6),
                child: Container(
                  height: 100.h,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      headmenu[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }));
  }
}
