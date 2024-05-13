import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SwitchButtonCommon extends StatefulWidget {
  IconData icon;

  String dataName;

  SwitchButtonCommon({super.key, required this.icon, required this.dataName});

  @override
  State<SwitchButtonCommon> createState() => _SwitchButtonCommonState();
}

class _SwitchButtonCommonState extends State<SwitchButtonCommon> {
  final ValueNotifier<bool> isSwitch = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 6.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(widget.icon)),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        widget.dataName,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isSwitch,
                  builder: (context, value, child) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Switch(
                            activeColor: Colors.black,
                            value: isSwitch.value,
                            onChanged: (onandoff) {
                              isSwitch.value = !isSwitch.value;
                              isSwitch.notifyListeners();
                            }));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
