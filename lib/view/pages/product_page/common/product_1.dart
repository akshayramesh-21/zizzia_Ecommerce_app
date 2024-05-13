// import 'package:e_commercial/controller/functions/datas/commonUtilites.dart';

// import 'package:e_commercial/view/pages/top_selling.dart/common/product_listing.dart';
// import 'package:e_commercial/view/widgets/drop_down_button.dart';
// import 'package:flutter/material.dart';

// class Product_1 extends StatelessWidget {
//   var productTitle;

//   Product_1({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back),
//         title: Text("productTitle"),
//       ),
//       body: Column(
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10.0, top: 4, bottom: 8),
//               child: Container(
//                 width: 170,
//                 height: 40,
//                 child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Center(child: DropDownButton1())),
//               ),
//             ),
//           ),
//           ProductListing(
//               imagedata: imagess,
//               itemname: recoName,
//               realPrice: priceTag,
//               discountPrice: priceDis)
//         ],
//       ),
//     );
//   }
// }
