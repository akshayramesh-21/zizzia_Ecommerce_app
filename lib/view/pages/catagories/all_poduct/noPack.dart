import 'dart:developer';


import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/pagination/paginaton_refresh_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/product_page/productSpecific.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class PaginationFetchPages extends StatefulWidget {
  const PaginationFetchPages({super.key});

  @override
  State<PaginationFetchPages> createState() => _PaginationFetchPagesState();
}

class _PaginationFetchPagesState extends State<PaginationFetchPages> {
  ScrollController scrollControl = ScrollController();
  ValueNotifier<bool> isLoading = ValueNotifier(true);

  int page = 1;
  @override
  void initState() {
    BlocProvider.of<PaginatonRefreshBloc>(context)
        .add(FetchPagination(pageNo: page, context: context));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<PaginatonRefreshBloc, PaginatonRefreshState>(
            listener: (context, state) {
//     
    }, child: BlocBuilder<PaginatonRefreshBloc, PaginatonRefreshState>(
      builder: (context, state) {
        if (state is LoadingPagination) {
          log("Loading Pagination ui inside");
          return Center(
              child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text("Items loading"),
                ProgressIndicate()
              ],
            ),
          ));
        }

        if (state is LoadedPagination) {
          log("LoadedPagination ui inside");

          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    controller: scrollControl,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.allProduct.product!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (.7),
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      if (index < state.allProduct.product!.length) {
                        return InkWell(
                          onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductSpecific(


                        
                            qty: state.allProduct.product![index].qty.toString() ,

                            description:state.allProduct.product![index].description.toString() ,
                            
                           img:state.allProduct.product![index].image.toString() , 
                           itemName: state.allProduct.product![index].name.toString(),
                           idCart:state.allProduct.product![index].id.toString(),
                            itemPrice:state.allProduct.product![index].price.toString(),
                          )
                          )
                          
                          );














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
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 100.w,
                                        height: 20.h,
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12.0),
                                            child: Container(
                                              width: 30.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      'http://$ip:3000/products-images/${state.allProduct.product![index].image}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 10,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.lime.shade300,
                                            child: FavoriteButton(
                                              iconSize: 38,
                                             iconDisabledColor:  Colors.white,
                                            
                                              valueChanged: (isFavorite) {
                                                BlocProvider.of<WishlistBloc>(
                                                        context)
                                                    .add(WishListAdd(
                                                  context: context,
                                                  id: state.allProduct
                                                      .product![index].id
                                                      .toString(),
                                                ));
                          
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
                          
                                                print('Is Favorite $isFavorite)');
                                              },
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12.0, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.allProduct.product![index].name
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'font1',
                                            color: Color.fromARGB(136, 57, 34, 1),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          state.allProduct.product![index]
                                              .description
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontFamily: 'font1',
                                            color: Color.fromARGB(136, 57, 34, 1),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "₹${state.allProduct.product![index].price.toString()}",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(child: ProgressIndicate());
                      }
                    }),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () async {
                    if (state.allProduct.totalPages! >
                        state.allProduct.currentPage!) {
                      final nextPage = state.allProduct.currentPage! + 1;
                      BlocProvider.of<PaginatonRefreshBloc>(context).add(
                        FetchPagination(pageNo: nextPage, context: context),
                      );
                    }
                  },
                  icon: Icon(Icons.skip_next),
                  disabledColor: Colors.grey,
                  color: state.allProduct.totalPages ==
                          state.allProduct.currentPage
                      ? Colors.grey
                      : null,
                ),
              ),
             Positioned(
  left: 0,
  bottom: 0,
  child: IconButton(
    onPressed: state.allProduct.currentPage! > 1 ? () {
      final previousPage = state.allProduct.currentPage! - 1;
      BlocProvider.of<PaginatonRefreshBloc>(context).add(
        FetchPagination(pageNo: previousPage, context: context),
      );
    } : null,
    icon: Icon(Icons.skip_previous),
    disabledColor: Colors.grey,
    color: state.allProduct.currentPage == 1 ? Colors.grey : null,
  ),
),

            ],
          );
        } else {
          return Center(child: Text("wrong 111"));
        }
      },
    )));
  }
}
