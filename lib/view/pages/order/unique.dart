
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/invoiceDownload/invoice_download_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/order_history/order_histroy_bloc.dart';
import 'package:zizzia_e_commerce/controller/functions/camera_gallery/cemara_gallery.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/order/widget/timeline_tile.dart';


class OrderDetails extends StatefulWidget {
  final int indexAll;
  final int indexUnique;

  OrderDetails({
    Key? key,
    required this.indexAll,
    required this.indexUnique,
  }) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    BlocProvider.of<OrderHistroyBloc>(context).add(OrderFetch());
    super.initState();
    checkPermissionStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocBuilder<OrderHistroyBloc, OrderHistroyState>(
        builder: (context, state) {
          if (state is orderLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is orderLoaded) {
            if (state.orderItems.length != 0) {
              return ListView.builder(
                itemCount: widget.indexUnique,
                itemBuilder: (context, index) {
                  DateTime orderDate =
                      state.orderItems[widget.indexAll].orderDate;
                  final DateFormat formatter = DateFormat('dd/MM/yy');
                  final String formattedDate = formatter.format(orderDate);

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blueGrey, width: 1),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'http://$ip:3000/products-images/${state.orderItems[widget.indexAll].items[index].product.image}',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Order",
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'font1',
                              ),
                            ),
                          ),
                          rowMethod(
                            'item',
                            'Order id',
                            '${state.orderItems[widget.indexAll].items[index].product.name}',
                            '${state.orderItems[widget.indexAll].orderID}',
                          ),
                          SizedBox(height: 1.h),
                          rowMethod(
                            'DATE',
                            'Address',
                            '$formattedDate',
                            '${state.orderItems[widget.indexAll].address}',
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "order Histroy",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'font1',
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Item Details",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'font1',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        
                          MyTimeLineTile(
                            isFirst: true,
                            isLast: false,
                            isPast: state.orderItems[widget.indexAll].status == "Pending" ? true : false,
                            textdata: "Order pending",
                          ),
                          MyTimeLineTile(
                            isFirst: state.orderItems[widget.indexAll].status == "placed" ? true : false,
                            isLast:state.orderItems[widget.indexAll].status == "placed" ? true : false,
                            isPast: state.orderItems[widget.indexAll].status == "placed" ? true : false,
                            textdata: "Order placed",
                          ),
                         
                          MyTimeLineTile(
                            isFirst: state.orderItems[widget.indexAll].status == "Shipped" ? true : false,
                            isLast: state.orderItems[widget.indexAll].status == "Shipped" ? true : false,
                            isPast: state.orderItems[widget.indexAll].status == "Shipped" ? true : false,
                            textdata: "Order Shipped",
                          ),
                          MyTimeLineTile(
                            isFirst: state.orderItems[widget.indexAll].status == "Delivered" ? true : false,
                            isLast: state.orderItems[widget.indexAll].status == "Delivered" ? true : false,
                            isPast: state.orderItems[widget.indexAll].status == "Delivered" ? true : false,
                            textdata: "Order delivered",
                          ),

                           InkWell(onTap: (){

        BlocProvider.of<InvoiceDownloadBloc>(context).add(InvoiceDownload(orderid: state.orderItems[widget.indexAll].orderID));
       


        




       },
         child: Column(children: [
             Text(
              "Download an Invoice",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Center(
              child: Container(
                height: 5.h,
                width: 20.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/downloadinvo.gif'),
                )),
              ),
            ),
         ],),
       ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return SizedBox();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Padding rowMethod(String a, String b, String c, String d) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                a,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Colors.black.withOpacity(.4),
                ),
              ),
              Text(
                c,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                b,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Colors.black.withOpacity(.4),
                ),
              ),
              Text(
                d,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'font1',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
