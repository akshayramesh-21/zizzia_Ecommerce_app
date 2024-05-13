// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/CartGet/cart_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/cart_update/cart_item_pass_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/cart/cart.dart';



class ProductSpecific extends StatelessWidget {
  String img;

  String itemName;

  String itemPrice;
    String description;
  


  String idCart;
  
  var qty;
  ProductSpecific({
    Key? key,
    required this.img,
    required this.itemName,
    required this.itemPrice,
    required this.description,
    required this.idCart,
     required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                icon: Icon(Icons.shopping_bag)),
          ),
        ],
      ),
      bottomNavigationBar: qty=="0"? Container(
          height: 10.h,
          color: const Color.fromARGB(109, 106, 93, 1),
          child: Center(
              child: Text(
            "Out of Stock",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'font1',
            ),
          )),
        ):   InkWell(
        onTap: () async {
          BlocProvider.of<CartItemPassBloc>(context)
              .add(CartPostSend(itemId: await idCart));

          BlocProvider.of<CartGetBloc>(context).add(CartFetch());

          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  content: Center(
                                                      child: Text(
                                                          'Added to Cart',style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'font1',
            ), ))));
        },
        child: Container(
          height: 10.h,
          color: const Color.fromARGB(109, 106, 93, 1),
          child: Center(
              child: Text(
            "Add To Cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'font1',
            ),
          )),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 80.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 194, 194, 188),
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: NetworkImage(
                            'http://$ip:3000/products-images/$img',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.lime.shade300,
                        child: FavoriteButton(
                          iconDisabledColor: Colors.white,
                          iconSize: 38,
                          valueChanged: (_isFavorite) {


                            














                            BlocProvider.of<WishlistBloc>(context)
                                .add(WishListAdd(context: context, id: idCart));

                            BlocProvider.of<WishlistBloc>(context)
                                .add(WishListFetch());


  ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  content: Center(
                                                      child: Text(
                                                          _isFavorite
                                        ? 'Added to Favorite'
                                        : 'Removed from Favorite',style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'font1',
            ), ))));
















                          

                            print('Is Favorite $_isFavorite)');
                          },
                        ),
                      )

                      
                      ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 194, 188),
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: NetworkImage(
                              'http://$ip:3000/products-images/$img',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 194, 188),
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: NetworkImage(
                              'http://$ip:3000/products-images/$img',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0),
            //   child: Text("Ready to wear",
            //       style: TextStyle(
            //         fontSize: 20.sp,
            //         fontFamily: 'font1',
            //         color: Color.fromARGB(54, 57, 34, 1),
            //       )),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      itemName,
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontFamily: 'font1',
                        color: Color.fromARGB(136, 57, 34, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    '₹${itemPrice}',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'font1',
                      color: Color.fromARGB(136, 57, 34, 1),
                    ),
                  ),
                ),
              ],
            ),


             Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'DESCRIPTION',
                    style: TextStyle(
                      fontSize:12.sp,
                      
                      color: Color.fromARGB(136, 57, 34, 1),
                    ),
                  ),
                ),

                   Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize:12.sp,
                      
                      color: Color.fromARGB(135, 7, 7, 7),
                    ),
                  ),
                ),


         




            // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            //   children: [
            //   sizeChart('S'),
            //   sizeChart('M'),
            //   sizeChart('L'),
            //   sizeChart('XL'),
            // ],)
          ],
        ),
      ),
    );
  }

  Padding sizeChart(String t) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 16.w,
        height: 8.h,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(25)),
        child: Center(child: Text(t)),
      ),
    );
  }
}
