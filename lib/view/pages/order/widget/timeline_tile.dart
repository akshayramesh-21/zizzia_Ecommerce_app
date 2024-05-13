// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  String textdata;

  MyTimeLineTile({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.textdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8),
      child: Container(
        height: 13.h,
        child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(color:isPast? Colors.greenAccent:Colors.greenAccent.withOpacity(.4)),
          indicatorStyle: IndicatorStyle(
              color: isPast? Colors.greenAccent:Colors.greenAccent.withOpacity(.4),
              width: 30,
              iconStyle: IconStyle(iconData: Icons.done, color: Colors.white)),
          endChild: Card(color: const Color.fromARGB(221, 181, 156, 156),
        child: ListTile(tileColor: Colors.white,
          leading: const Icon(Icons.fitness_center),
          title: Text(textdata, style:  TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'font1',

                  color: Colors.black,
                ),),
          // subtitle: Text('${textdata}  '),
        ),
      )
         
        ),
      ),
    );
  }
}
