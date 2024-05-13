// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class PassTextFieldCommon extends StatelessWidget {
//   String data;

//   String hintText;

//   PassTextFieldCommon({super.key, required this.data, required this.hintText});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 0.0, left: 8),
//           child: Text(
//             data,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 6),
//           child: Container(
//             width: 90.w,
//             height: 6.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.blueGrey,
//                 )),
//             child: TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                     fontSize: 12.sp,
//                     fontFamily: 'font1',
//                     color: Color.fromARGB(136, 57, 34, 1),
//                     fontWeight: FontWeight.w300)
//               )
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
