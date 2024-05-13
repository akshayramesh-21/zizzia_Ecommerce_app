import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IndicatorPage extends StatefulWidget {
  const IndicatorPage({super.key});

  @override
  State<IndicatorPage> createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        

        children: [SizedBox(height: 35.h,),

        Center(child: CircularProgressIndicator()),
        Center(child: Text('Loading', style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'font1',
                    color: Color.fromARGB(136, 57, 34, 1),
                    fontWeight: FontWeight.w300),))



        ],




      ),


    );
  }
}