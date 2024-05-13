// import 'package:flutter/material.dart';

// /// Flutter code sample for [DropdownButton].

// const List<String> list = <String>[
//   'Price :Low to High',
//   'Price:High to Low',
//   'Newset',
//   'Relavance'
// ];

// class DropDownButton1 extends StatefulWidget {
//   const DropDownButton1({super.key});

//   @override
//   State<DropDownButton1> createState() => _DropDownButton1State();
// }

// class _DropDownButton1State extends State<DropDownButton1> {
//   ValueNotifier<String> dropdownValue = ValueNotifier<String>(list.first);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: dropdownValue,
//       builder: (context, value, child) {
//         return DropdownButton<String>(
//           value: dropdownValue.value,
//           icon: const Icon(Icons.arrow_downward),
//           elevation: 16,
//           style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//           onChanged: (String? value) {
//             dropdownValue.value = value!;
//             // This is called when the user selects an item.
//           },
//           items: list.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
