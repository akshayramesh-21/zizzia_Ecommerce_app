
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/CartGet/cart_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/cart_update/cart_item_pass_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/checkout/addressPost.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartGetBloc>(context).add(CartFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
      bottomNavigationBar: BlocBuilder<CartGetBloc, CartGetState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.cartItems.data?.totalPrice == null) {
              return BottomButton('0');
            } else {
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddressPost()));
                  },
                  child: BottomButton(
                      state.cartItems.data!.totalPrice.toString()));
            }
          } else {
            return SizedBox();
          }
        },
      ),
      body: BlocBuilder<CartGetBloc, CartGetState>(
        builder: (context, state) {

        if(state is CartLoading){
          return  Center(child: Center(
            child: ProgressIndicate()
          ));

        }


          if (state is CartLoaded) {
            log("${state.cartItems.data?.items!.length}");

            if (state.cartItems.success == "success") {
              return state.cartItems.data!.items!.isEmpty
                  ? Center(
                      child: Text("Empty cart ",style: TextStyle(
                    
                    fontFamily: 'font1',
                    
                    fontWeight: FontWeight.bold),),
                    )
       : CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                child: Container(
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: InkWell(
                                          onTap: () async {


                                            if (state.cartItems.data
                                                    ?.items?[index].product?.sId
                                                    .toString() !=
                                                null) {
                                              log("DatA id Working");
                                              BlocProvider.of<CartItemPassBloc>(
                                                      context)
                                                  .add(CartValueDelete(
                                                      context: context,
                                                      itemId: state
                                                          .cartItems
                                                          .data!
                                                          .items![index]
                                                          .product!
                                                          .sId
                                                          .toString()));
                                            } else {
                                              log('${state.cartItems.data?.items?[index].product?.sId.toString()}');
                                            }
                                          },
                                          child: CircleAvatar(
                                            radius: 4.w,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 154, 39, 39),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Container(
                                          height: 15.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'http://$ip:3000/products-images/${state.cartItems.data!.items![index].product!.image}'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              state.cartItems.data!
                                                  .items![index].product!.name
                                                  .toString(),
                                              style: TextStyle(
                    
                    fontFamily: 'font1',
                    fontSize: 16.sp,
                    
                    fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    255, 4, 4, 4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "₹${state.cartItems.data!.items![index].product!.price.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              if (state
                                                      .cartItems
                                                      .data
                                                      ?.items?[index]
                                                      .product
                                                      ?.sId !=
                                                  null) {
                                                BlocProvider.of<
                                                            CartItemPassBloc>(
                                                        context)
                                                    .add(CartValueAdd(
                                                        context: context,
                                                        add: await state
                                                            .cartItems
                                                            .data!
                                                            .items![index]
                                                            .product!
                                                            .sId
                                                            .toString()));
                                              } else {
                                                log("cart add amount id is null");
                                              }
                                            },
                                            child: CircleAvatar(
                                              radius: 4.w,
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              child: Text(
                                                state.cartItems.data!
                                                    .items![index].quantity
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              if (state
                                                      .cartItems
                                                      .data
                                                      ?.items?[index]
                                                      .product
                                                      ?.sId !=
                                                  null) {
                                                BlocProvider.of<
                                                            CartItemPassBloc>(
                                                        context)
                                                    .add(CartValueRemove(
                                                        context: context,
                                                        remove: await state
                                                            .cartItems
                                                            .data!
                                                            .items![index]
                                                            .product!
                                                            .sId
                                                            .toString()));
                                                log("${state.cartItems.data!.items![index].quantity.toString()}");
                                              } else {
                                                log("cart add amount id is null");
                                              }
                                            },
                                            child: CircleAvatar(
                                              radius: 4.w,
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            childCount: state.cartItems.data!.items!.length??0,
                          ),
                        ),
                      ],
                    );
            } 
            else {
              return Center(
                child: Container(
                  child: Text("Empty Cart ", style: TextStyle(
                    
                    fontFamily: 'font1',

                    
                    fontWeight: FontWeight.bold),),
                ),
              );
            }
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Padding BottomButton(String text) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        height: 10.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Total amount=$text",
                style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.white,
                    fontSize: 16.sp,
                    
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Make Payment",
                style: TextStyle(
                    
                    fontFamily: 'font1',
                    color: Colors.white,
                    fontSize: 12.sp,
                    
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.black,
        ),
      ),
    );
  }
}
