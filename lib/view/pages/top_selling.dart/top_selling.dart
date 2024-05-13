
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';
import 'package:zizzia_e_commerce/view/pages/top_selling.dart/common/headMenu.dart';
import 'package:zizzia_e_commerce/view/pages/top_selling.dart/common/product_listing.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Top selling",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: Column(
        children: [
          HeadMenu(headmenu: cataName),
          ProductListing(
            imagedata: imagess,
            realPrice: priceTag,
            itemname: recoName,
            discountPrice: priceDis,
          ),
        ],
      ),
    );
  }
}
