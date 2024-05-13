import 'dart:developer';

import 'package:favorite_button/favorite_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/searchbare/search_bar_function_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/wishlist/wishlist_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/product_page/productSpecific.dart';
import 'package:zizzia_e_commerce/view/widgets/progressIndicator.dart';
class CustomSearchDelegate extends SearchDelegate<String> {
  
  final SearchBarFunctionBloc searchBarBloc = SearchBarFunctionBloc();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBarBloc.add(TextFieldChanges(query));
    return Container(width:double.infinity,height: double.infinity, color: Colors.cyanAccent,
      child: BlocBuilder<SearchBarFunctionBloc, SearchBarFunctionState>(
        bloc: searchBarBloc,
        builder: (context, state) {

         

          if (state is SearchBarFunctionLoading) {
            return Center(
              child: Center(
            child: ProgressIndicate()
          )
            );
          } else if (state is SearchBarFunctionLoaded) {
             log('product name+++++++${state.searchitems.items[0].name}');
            return Container(width:double.infinity,height: double.infinity,color: Color.fromARGB(255, 63, 29, 214),
              child: ListView.builder(
                itemCount: state.searchitems.items.length??0,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      title: Text(state.searchitems.items[index].name),
                    ),
                  );
                },
              ),
            );
          } else if (state is SearchBarFunctionError) {
            return Center(
              child: Text("Error occurred while searching."),
            );
          } else {
            return Center(
              child: Text('Start searching...'),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
    // Trigger the search only when the query is not empty
    searchBarBloc.add(TextFieldChanges(query));
  }
  
  return BlocBuilder<SearchBarFunctionBloc, SearchBarFunctionState>(
    bloc: searchBarBloc,
    builder: (context, state) {
      if (state is SearchBarFunctionLoading) {
        return Center(
          child: Center(
            child: ProgressIndicate()
          )
        );
      } else if (state is SearchBarFunctionLoaded) {
        if (state.searchitems.items.isNotEmpty) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.searchitems.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (.7),
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductSpecific(
                            qty:state.searchitems.items[index].qty ,
                            description: state.searchitems.items[index].description,
                           img:state.searchitems.items[index].image , 
                           itemName:  state.searchitems.items[index].name.toString(),
                           idCart: state.searchitems.items[index].id.toString(),
                            itemPrice: state.searchitems.items[index].price.toString(),
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
                                              'http://$ip:3000/products-images/${state.searchitems.items[index].image.toString()}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child:  CircleAvatar(backgroundColor:Colors.lime.shade300,
                                  child: FavoriteButton(iconDisabledColor: Colors.white,
                                                           iconSize: 38,
                                                      valueChanged:  (_isFavorite) {
                                  
                                              BlocProvider.of<WishlistBloc>(context)
                                                               .add(WishListAdd(context: context,id: state.searchitems.items[index].id.toString()));
                                  
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
                                Text("${state.searchitems.items[index].name.toString()}",
                                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,fontFamily: "font2"),),
                                Text(
                                  state.searchitems.items[index].description.toString(),
                                  maxLines: 1,
                                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400,fontFamily: "font2"),
                                ),
                                Center(child: Text("₹${state.searchitems.items[index].price.toString()}",
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
        } else {
          // Display a message when no search results are found
          return Center(child: Text("No search results found."));
        }
      } else if (state is SearchBarFunctionError) {
        return Center(
          child: Text("Error occurred while searching."),
        );
      } else {
        return Center(
          child: Text('Start searching...'),
        );
      }
    },
  );
  }
}
