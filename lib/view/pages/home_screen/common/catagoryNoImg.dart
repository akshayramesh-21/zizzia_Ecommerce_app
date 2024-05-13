
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/electronics.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/fancy.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/fashion.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/jewellery.dart';

class CataNoImg extends StatelessWidget {
   CataNoImg({super.key});
List cata=['FASHION', 'ELECTRONICS', 'FANCY','JEWELLERY'];
  @override
  Widget build(BuildContext context) {
    return   Container(
      
          height: 7.h,
          width: 100.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: cata.length,
              itemBuilder: (context, index) {
                return InkWell(
                 onTap: (){

                   if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllFashion()));
                    
                  }
                  else if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllElectronics()));
                    
                  }

                  else if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllFancy()));
                    
                  }

                  else if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllJewelery()));
                    
                  }



                 },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      
                      child: Center(child: Text(cata[index],style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'font1',
                       fontSize: 28, color: const Color.fromARGB(109,106,93,1)), )
                       ),
                    
                    ),
                  ),
                );
              }),
        );
  }
}