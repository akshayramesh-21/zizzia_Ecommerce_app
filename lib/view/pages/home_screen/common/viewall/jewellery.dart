
import 'dart:developer';


import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/home_data_get/home_data_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/product_page/productSpecific.dart';



class ViewAllJewelery extends StatefulWidget {

  ViewAllJewelery({
    Key? key,
   
  }) : super(key: key);

  @override
  State<ViewAllJewelery> createState() => _ViewAllElectronicsState();
  
} 

class _ViewAllElectronicsState extends State<ViewAllJewelery> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeDataGetBloc>(context).add(ItemStore());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "jwellery",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      body: BlocBuilder<HomeDataGetBloc, HomeDataGetState>(
        builder: (context, state) {
          log(("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"));
        if (state is LoadedState){
               log(("#######################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"));
         return     Container(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.itemList.jwellery!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (.7),
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductSpecific(
                              qty:state.itemList.jwellery![index]!.description.toString() ,
                             description: state.itemList.jwellery![index]!.description.toString() ,
                           img:state.itemList.jwellery![index]!.image.toString() , 
                           itemName:  state.itemList.jwellery![index]!.name.toString(),
                           idCart: state.itemList.jwellery![index]!.id.toString(),
                            itemPrice: state.itemList.jwellery![index]!.price.toString(),
                          )));
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: 45.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                  
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 100.w,
                                height: 20.h,
                                
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Container(
                                      
                                      width: 30.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),color: Colors.black45,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'http://$ip:3000/products-images/${state.itemList.jwellery![index]!.image.toString()}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: CircleAvatar(backgroundColor: Colors.lime.shade300,
                                  child: FavoriteButton(iconDisabledColor: Colors.white,
                                                       iconSize: 38,
                                                      valueChanged:  (_isFavorite) {
                                  
                                              BlocProvider.of<WishlistBloc>(context)
                                                               .add(WishListAdd(context: context,id: state.itemList.jwellery![index]!.id.toString()));
                                  
                                  BlocProvider.of<WishlistBloc>(context).add(WishListFetch());
                                  
                                                print('Is Favorite $_isFavorite)');
                                              },
                                                      
                                                     ),
                                )
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${state.itemList.jwellery![index]!.name.toString()}",
                                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,fontFamily: "font2"),),
                                Text(
                                  state.itemList.jwellery![index]!.description.toString(),
                                  maxLines: 1,
                                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400,fontFamily: "font2"),
                                ),
                                Center(child: Text("₹${state.itemList.jwellery![index]!.price.toString()}",
                                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w400,fontFamily: "font2"),
                                
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );

        }
       
          return SizedBox();
        
        },
      ),
    );
  }
}
