// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewButtons extends StatelessWidget {

  ViewButtons({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                    width: 22.w,
                    height: 30,
                    child: Row(
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(fontFamily: "font2",
                            color: const Color.fromARGB(255, 82, 143, 174),
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  );
  }
}
