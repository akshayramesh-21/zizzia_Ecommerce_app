
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';

class NotificaionList extends StatelessWidget {
  NotificaionList({
    super.key,
  });

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
      body: ListView.builder(
          itemCount: imagess.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Color.fromARGB(96, 233, 211, 211), width: 8)),
              child: Row(
                children: [
                  Container(
                      width: 80,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imagess[index])),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        imagess[index],
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification type',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text("details")
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
