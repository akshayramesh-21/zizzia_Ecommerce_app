import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/order_history/order_histroy_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/order/unique.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderHistroyBloc>(context).add(OrderFetch());




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        centerTitle: true,
        title: Text(
          "Orders",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
      ),
      body:


      
      
      
      
      
       BlocBuilder<OrderHistroyBloc, OrderHistroyState>(
        builder: (context, state) {
          log('orders bloc builder');
          if (state is orderLoaded) {
            log('orders bloc builder orderLoaded');
            log("${state.orderItems.length}");

            if (state.orderItems.length == 0) {
              return Center(
                child: Text("No order "),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, orderIndex) {
                       
                        DateTime orderDate =  state.orderItems[orderIndex].orderDate;
                        final DateFormat formatter = DateFormat('dd/MM/yy');
                        final String formattedDate = formatter.format(orderDate);

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                          child: Container(
                            
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blueGrey, width: 1),
                            ),
                            child:
                             Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 2.w, right: 2.w),
                                  child: Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'http://$ip:3000/products-images/${ state.orderItems[orderIndex].items[0].product.image}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey,
                                    ),

                                    child: state.orderItems[orderIndex].items.length>=2? 
                                    Container(decoration: BoxDecoration(color: Color.fromARGB(86, 106, 170, 219),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                      child: Text('+${state.orderItems[orderIndex].items.length-1 } items')):SizedBox(),


                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Order id#${state.orderItems[orderIndex].orderID}',
                                        style: TextStyle(
                                       fontSize: 14.sp,
                                          fontFamily: 'font1',
                                          color: Colors.black.withOpacity(.4),
                                        ),
                                      ),
                                      Text(
                                        'Order date: $formattedDate',
                                        style: TextStyle(
                                        fontSize: 14.sp,
                                          fontFamily: 'font1',
                                          color: Colors.black,
                                        ),
                                        maxLines: 1,
                                      ),
                                      
                                        Text(
                                          'Price: ${state.orderItems[orderIndex].totalAmount}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                             fontFamily: 'font1',
                                            color: Colors.black,
                                            
                                          ),
                                        ),
                                        Text(
                                          'Status : ${state.orderItems[orderIndex].status}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'font1',
                                            color: Colors.black,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {

                                            
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => OrderDetails(indexUnique: state.orderItems[orderIndex].items.length,
                                                indexAll:orderIndex ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 40.w,
                                            height: 5.h,
                                            child: Center(child: Text("Order Details", style:  TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'font1',
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.h,)
                                      
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2.w),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: state.orderItems.length,
                    ),
                  ),
                ],
              );
            }
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
