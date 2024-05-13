
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';

class Catagories extends StatelessWidget {
  const Catagories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Container(
                width: 22.w,
                // height: 5.h,
                child: Row(
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 82, 143, 174)),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 15.h,
          width: 100.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: imagess.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 20.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(imagess[index]), fit: BoxFit.cover),
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          cataName[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 4.w,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
