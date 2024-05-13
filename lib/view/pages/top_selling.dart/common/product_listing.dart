import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductListing extends StatelessWidget {
  final  imagedata;

  final  itemname;

  final  realPrice;

  final  discountPrice;

  ProductListing(
      {Key? key,
      required this.imagedata,
      required this.itemname,
      required this.realPrice,
      required this.discountPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: imagedata.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (.7),
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(imagedata[index]),
                          fit: BoxFit.cover)),
                ),
                Text(itemname[index]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      realPrice[index],
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    Text(discountPrice[index]),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
