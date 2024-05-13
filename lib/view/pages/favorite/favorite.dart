
import 'package:favorite_button/favorite_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/favorite/no_items.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WishlistBloc>(context).add(WishListFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoaded) {
            if (state.wishlistItems != null &&
                state.wishlistItems!.wishlist!.isNotEmpty) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.wishlistItems!.wishlist!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (.7),
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    // final wishlistItem = state.wishlistItems.wishlist![index];
                    return Padding(
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
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Container(
                                        width: 30.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'http://$ip:3000/products-images/${state.wishlistItems!.wishlist![index].product!.image.toString()}'),
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
                                        iconColor:
                                            Color.fromARGB(255, 251, 24, 8),
                                        isFavorite: true,
                                        valueChanged: (isFavorite) {
                                          BlocProvider.of<WishlistBloc>(context)
                                              .add(WishListAdd(
                                            context: context,
                                            id: state.wishlistItems!
                                                .wishlist![index].product!.sId
                                                .toString(),
                                          ));

                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                            duration: Duration(milliseconds: 300),
                            content: Center(
                                child: Text(
                              'Removed from Favorite',
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
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.wishlistItems!.wishlist![index]
                                        .product!.name
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'font1',
                                      color: Color.fromARGB(136, 57, 34, 1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    state.wishlistItems!.wishlist![index]
                                        .product!.description
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
                                      "₹${state.wishlistItems!.wishlist![index].product!.price.toString()}",
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
                    );
                  },
                ),
              );
            } else if(state.wishlistItems!.wishlist!.isEmpty) {
              return EmptyFavorite(); // Display empty favorite widget
            }
            else{
              return CircularProgressIndicator();
            }
          } else {
            
            return Center(child: ProgressIndicate());
          }
        },
      ),
    );
  }
}
