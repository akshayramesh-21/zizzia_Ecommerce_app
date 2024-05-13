// import 'dart:developer';


// import 'package:favorite_button/favorite_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:sizer/sizer.dart';
// import 'package:zizzia_e_commerce/controller/bloc/pagination/paginaton_refresh_bloc.dart';
// import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
// import 'package:zizzia_e_commerce/ip/ip.dart';
// import 'package:zizzia_e_commerce/model/allProduct.dart';

// class PaginationAllProduct extends StatefulWidget {
//   const PaginationAllProduct({super.key});

//   @override
//   State<PaginationAllProduct> createState() => _PaginationAllProductState();
// }

// class _PaginationAllProductState extends State<PaginationAllProduct> {
//   @override
//   final PagingController<int, ProductAllData> pagingController =
//       PagingController(firstPageKey: 1);

//   void initState() {
//     super.initState();
//     BlocProvider.of<PaginatonRefreshBloc>(context)
//         .add(FetchPagination(pageNo: 1));
//     pagingController.addPageRequestListener((pageKey) {
//       final bloc = BlocProvider.of<PaginatonRefreshBloc>(context);

//       bloc.add(FetchPagination(pageNo: pageKey));

//       BlocProvider.of<PaginatonRefreshBloc>(context)
//           .add(FetchPagination(pageNo: 1));
//     });
//   }

//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () => Future.sync(() {
//         pagingController.refresh();
//         BlocProvider.of<PaginatonRefreshBloc>(context)
//             .add(FetchPagination(pageNo: 1));
//       }),
//       child: Scaffold(
//         body: BlocListener<PaginatonRefreshBloc, PaginatonRefreshState>(
//           listener: (context, state) {
//             if (state is LoadedPagination) {
//               final products = state.allProduct.product ?? [];
//               final isLastpage = products.length < 7;
//               final currentPage = state.allProduct.currentPage;
//               if (isLastpage && currentPage == 1) {
//                 pagingController.itemList?.clear();
//                 pagingController.appendLastPage(products);
//               } else if (currentPage == 1) {
//                 pagingController.itemList?.clear();
//                 final nextPage = currentPage! + 1;
//                 pagingController.appendPage(products, nextPage);
//               } else if (isLastpage) {
//                 pagingController.appendLastPage(products);
//               } else {
//                 final nextPageKey = currentPage! + 1;
//                 pagingController.appendPage(products, nextPageKey);
//               }
//             }
//           },
//           child: BlocBuilder<PaginatonRefreshBloc, PaginatonRefreshState>(
//             builder: (context, state) {
//               if (state is LoadingPagination) {
//                 log("Loading Pagination ui inside");
//               }

//               if (state is LoadedPagination) {
//                 log("LoadedPagination ui inside");
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     BlocProvider.of<PaginatonRefreshBloc>(context)
//                         .add(FetchPagination(pageNo: 1));
//                   },
//                   child: PagedListView<int, ProductAllData>.separated(
//                     pagingController: pagingController,
//                     builderDelegate: PagedChildBuilderDelegate<ProductAllData>(
//                         animateTransitions: true,
//                         itemBuilder: (context, post, index) {
//                           return Container(
//                             height: MediaQuery.of(context).size.height,
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.vertical,
//                               itemCount: state.allProduct.product!.length,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 childAspectRatio: (.7),
//                                 crossAxisCount: 2,
//                               ),
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Container(
//                                     width: 45.w,
//                                     height: 20.h,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Stack(
//                                           children: [
//                                             Container(
//                                               width: 100.w,
//                                               height: 20.h,
//                                               child: Center(
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 12.0),
//                                                   child: Container(
//                                                     width: 30.w,
//                                                     height: 20.h,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               15),
//                                                       image: DecorationImage(
//                                                         image: NetworkImage(
//                                                             'http://$ip:3000/products-images/${post.image![index]}'),
//                                                         fit: BoxFit.cover,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Positioned(
//                                                 right: 10,
//                                                 child: CircleAvatar(
//                                                   backgroundColor:
//                                                       Colors.lime.shade300,
//                                                   child: FavoriteButton(
//                                                     iconSize: 38,
//                                                     iconColor: Color.fromARGB(
//                                                         255, 251, 24, 8),
//                                                     isFavorite: true,
//                                                     valueChanged: (isFavorite) {
//                                                       BlocProvider.of<
//                                                                   WishlistBloc>(
//                                                               context)
//                                                           .add(WishListAdd(
//                                                         context: context,
//                                                         id: state.allProduct
//                                                             .product![index].id
//                                                             .toString(),
//                                                       ));

//                                                       ScaffoldMessenger.of(
//                                                               context)
//                                                           .showSnackBar(SnackBar(
//                                                               duration: Duration(
//                                                                   milliseconds:
//                                                                       300),
//                                                               content: Center(
//                                                                   child: Text(
//                                                                       'Removed from Favorite'))));

//                                                       print(
//                                                           'Is Favorite $isFavorite)');
//                                                     },
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 12.0, left: 10),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 state.allProduct.product![index]
//                                                     .name
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                   fontSize: 14.sp,
//                                                   fontFamily: 'font1',
//                                                   color: Color.fromARGB(
//                                                       136, 57, 34, 1),
//                                                   fontWeight: FontWeight.w300,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 state.allProduct.product![index]
//                                                     .description
//                                                     .toString(),
//                                                 maxLines: 1,
//                                                 style: TextStyle(
//                                                   fontSize: 10.sp,
//                                                   fontFamily: 'font1',
//                                                   color: Color.fromARGB(
//                                                       136, 57, 34, 1),
//                                                   fontWeight: FontWeight.w300,
//                                                 ),
//                                               ),
//                                               Center(
//                                                 child: Text(
//                                                   "₹${state.allProduct.product![index].price.toString()}",
//                                                   style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         }),
//                     separatorBuilder: (_, index) => const Divider(),
//                   ),
//                 );
//               } else {
//                 return Center(child: Text("wrong"));
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
