import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/CartGet/cart_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/cart_update/cart_item_pass_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';

class DealsHomeScreen extends StatefulWidget {
  String img;
  String headline;
  var description;
  var itemname;
  var priceDisount;
  var realPrice;
  var idCart;

  String qty;

  DealsHomeScreen(
      {Key? key,
      required this.qty,
      required this.img,
      required this.headline,
      required this.description,
      required this.itemname,
      required this.priceDisount,
      required this.realPrice,
      required this.idCart})
      : super(key: key);

  @override
  State<DealsHomeScreen> createState() => _DealsHomeScreenState();
}

class _DealsHomeScreenState extends State<DealsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(width: 80.w,
        decoration: BoxDecoration(
            color: Color.fromRGBO(224, 223, 222, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 159, 160, 167),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                )),
            width: 25.w,
            height: 15.h,
            child: Image.network(
              'http://$ip:3000/products-images/${widget.img}',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Container(width: 28.w,
                child: Flexible(
                  child: Text(
                     widget.itemname,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'font1',
                        color: Color.fromARGB(136, 57, 34, 1),
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
              Text(
                "₹${widget.realPrice}",
                style: TextStyle(
                  color: Color.fromARGB(188, 57, 34, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          widget.qty != "0"
              ? Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () async {
                        log(widget.idCart);

                        BlocProvider.of<CartItemPassBloc>(context)
                            .add(CartPostSend(itemId: await widget.idCart));

                        BlocProvider.of<CartGetBloc>(context).add(CartFetch());

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            duration: Duration(milliseconds: 300),
                            content: Center(
                                child: Text(
                              'Added to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'font1',
                              ),
                            ))));
                      },
                      icon: Icon(Icons.shopping_bag)))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Out",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " of ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " Stock",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
          SizedBox(
            width: 3.w,
          ),
        ]),
      ),
    );
  }
}
