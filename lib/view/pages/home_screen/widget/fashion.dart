
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/home_data_get/home_data_get_bloc.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/deal_homescreen.dart';
import 'package:zizzia_e_commerce/view/pages/product_page/productSpecific.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class Fashion extends StatelessWidget {
  const Fashion({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeDataGetBloc, HomeDataGetState>(
              builder: (context, state) {
                if (state is LoadedState) {
                  return Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))
                  ),
                    height: 15.h,
                    width: 100.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3?? 0,
                      itemBuilder: (context, index) { 
                        // Replace with your UI components
                        return InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductSpecific(


                        
                            qty:  state.itemList.fasion![index]!.qty.toString() ,

                            description:state.itemList.fasion![index]!.description.toString() ,
                            
                           img: state.itemList.fasion![index]!.image.toString() , 
                           itemName:  state.itemList.fasion![index]!.name.toString(),
                           idCart: state.itemList.fasion![index]!.id.toString(),
                            itemPrice: state.itemList.fasion![index]!.price.toString(),
                          )
                          )
                          
                          );
                        },
                          child: DealsHomeScreen(  
                             qty:  state.itemList.fasion![index]!.qty.toString() , 
                            idCart: state.itemList.fasion![index]!.id,
                            priceDisount:
                                state.itemList.fasion![index]!.price.toString(),
                            description: state
                                .itemList.fasion![index]!.description
                                .toString(),
                            headline: state.itemList.fasion![index]!.category
                                .toString(),
                            img: state.itemList.fasion![index]!.image.toString(),
                            itemname:
                                state.itemList.fasion![index]!.name.toString(),
                            realPrice:
                                state.itemList.fasion![index]!.price.toString(),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is loadingIntial) {
                  return Center(child: Center(
            child:ProgressIndicate()
          ));
                } else if (state is LoaderrorState) {
                  return Center(child: Text("Error: aasas"));
                } else {
                  return Center(child: Text("Unknown state"));
                }
              },
            );
  }
}