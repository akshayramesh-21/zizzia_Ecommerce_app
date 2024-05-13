
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';
import 'package:zizzia_e_commerce/view/pages/catagories/all_poduct/noPack.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/electronics.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/fancy.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/fashion.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/jewellery.dart';

class CatagoryPage extends StatelessWidget {
   CatagoryPage({Key? key}) : super(key: key);
  List a=[ViewAllFashion(), ViewAllElectronics(), ViewAllFancy(),
  ViewAllJewelery()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaginationFetchPages()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                width: 90.w,
                height: 10.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 174, 203, 12),
                ),
                child: Center(
                  child: Text(
                    'All products',
                    style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: 'font1',
                    color:Colors.black,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.3, // Aspect ratio = width / height
                mainAxisSpacing: 8, // Adjust spacing between items vertically
                crossAxisSpacing: 8,
                crossAxisCount: 2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>a[index]));},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(imagess[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(255, 51, 79, 203).withOpacity(.4),
                              Color.fromARGB(255, 51, 170, 203).withOpacity(.5),
                            ],
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            cataName[index],
                            style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'font1',
                    color:Colors.white,
                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
