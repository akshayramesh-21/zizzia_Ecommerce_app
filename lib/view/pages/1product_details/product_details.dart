import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/common_widget/bottomSheet.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';

class ProductDetails extends StatelessWidget {
  int? indexx;
  List<String>? information;

  ProductDetails({
    super.key,
    this.indexx,
    this.information,
  });
  double a = 4.9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 50.h,
              child: Swiper(
                  loop: true,
                  autoplay: true,
                  pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.blueAccent)),
                  control: SwiperControl(
                      disableColor: Colors.transparent,
                      color: Colors.transparent),
                  itemCount: productsImg.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage(
                              productsImg[index],
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 10,
                            top: 10,
                            child: IconButton(
                              iconSize: 40,
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              color: Color.fromARGB(255, 235, 229, 229),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: const Color.fromARGB(255, 232, 190, 36),
                ),
                Text('$a Ratings'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("product smaller description details"),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Colors: '),
                        Text('Available : ${itemColor.length}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Container(
                    width: 100.h,
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemColor.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: itemColor[index],
                                  shape: BoxShape.circle),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Container(
              width: 100.w,
              height: 10.h,
              color: Color.fromARGB(255, 251, 248, 248),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/delivery-boy.png',
                    width: 20.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Estimate Delivery  Time',
                      ),
                      Text(
                        'Delivery Date',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Information',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery & Return',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {
                        BottomSheetInformation();
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
