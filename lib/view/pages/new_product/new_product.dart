
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';
import 'package:zizzia_e_commerce/view/pages/top_selling.dart/common/headMenu.dart';
import 'package:zizzia_e_commerce/view/pages/top_selling.dart/common/product_listing.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "New product",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: Column(
        children: [
          HeadMenu(headmenu: cataName),
          ProductListing(
              imagedata: imagess,
              itemname: recoName,
              realPrice: priceTag,
              discountPrice: priceDis)
        ],
      ),
    );
  }
}
