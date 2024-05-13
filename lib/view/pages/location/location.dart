import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Select your location",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100.w,
                height: 60.h,
                color: Colors.amberAccent,
              ),
              Positioned(
                top: 50,
                left: 5.w,
                child: Container(
                    width: 90.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 232, 237, 239)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Location',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            'Location details',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(90.w, 60),
                  backgroundColor: Color.fromARGB(255, 87, 162, 223)),
              onPressed: () {},
              child: Text(
                'Confirm address',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
