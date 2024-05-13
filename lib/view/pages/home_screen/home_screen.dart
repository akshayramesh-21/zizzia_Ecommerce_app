

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/CartGet/cart_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/banner/banner_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/home_data_get/home_data_get_bloc.dart';
import 'package:zizzia_e_commerce/controller/bloc/profilePage/profile_page_bloc.dart';
import 'package:zizzia_e_commerce/controller/functions/datas/commonUtilites.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/model/homeModel.dart';
import 'package:zizzia_e_commerce/view/pages/cart/cart.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/banner/bannerUi.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/catagoryNoImg.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/headline.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/searchbar.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/electronics.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/fancy.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/fashion.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewall/jewellery.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/common/viewallButton.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/widget/electronics.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/widget/fancy.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/widget/fashion.dart';
import 'package:zizzia_e_commerce/view/pages/home_screen/widget/jewellery.dart';
import 'package:zizzia_e_commerce/view/pages/profile/edit_profile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  

    BlocProvider.of<HomeDataGetBloc>(context).add(ItemStore());

    BlocProvider.of<ProfilePageBloc>(context).add(ProflieSucess());
    BlocProvider.of<BannerBloc>(context).add(BannerSuccess());
    


  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
   
  },
      child: Scaffold(
      
       
      
        appBar: AppBar(
          toolbarHeight: 6.h,
          leading:
      
          
            BlocBuilder<ProfilePageBloc, ProfilePageState>(
                builder: (context, state) {
                  if (state is ProfilePageLoaded) {
                    if (state.list.data?.image!=null) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(
                          'http://$ip:3000/products-images/${state.list.data!.image}',
                        ),
                        radius: 30,
                      );
                    } else {
                      return IconButton(
                        onPressed: () {


 Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));

                        },
                        icon: Icon(Icons.person),
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
           
      
      
      
      
      
      
      
         
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(fontFamily: 'eurofighterexpandital'),
          ),
          actions: [
      
            IconButton(onPressed: (){
              
      
                  BlocProvider.of<CartGetBloc>(context).add(CartFetch());
      
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
      
              
            }, icon: Icon(Icons.shopping_bag))
      
      
      
      
      
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
                width: 20.w,
              ),
      
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(109, 106, 93, 1)),
                      child: Text(
                        '  ALL  ',
                        style: TextStyle(
                            fontFamily: 'font1',
                            fontSize: 24.sp,
                            color: Colors.white),
                      ),
                    ),
                    CataNoImg(),
                  ],
                ),
              ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          isDense: true,
                         
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 3)
                          ),
                    
                                   
                   
                          hintText: 'Search',
                          hintStyle: TextStyle(fontFamily: "font1"),
                          prefixIcon: Icon(Icons.search),
                        ),
                        
                         
                         
                               
                    onTap: () { _focusNode.unfocus();
                      
                       showSearch(
                        context: context,
                    delegate: CustomSearchDelegate(),
                        );
                     
                    },
                         
                         
                         
                         
                         
                         
                      ),
                 ),
      
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Expanded(
              //     child: Container(height: 8.h,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       border: Border.all(width: 1)
              //     ),
              //       child:
                  
              //       ),
              //   ),
              // ),
      
              BannerUi(),
      
              SizedBox(
                height: 5,
              ),
             
      
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headline(dealine: "Fashion",),
                   InkWell(
      
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllFashion()));
                      
                    },
      
      
                    child: ViewButtons())
      
      
                  
                ],
              ),
              Fashion(),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 100.w,
                  height: 20.h,
                  child: Image.asset(
                    adImah1,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 5,
              ),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headline(dealine: "Electronics",),
                   InkWell(
      
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllElectronics()));
                      
                    },
      
      
                    child: ViewButtons())
      
      
                  
                ],
              ),
              Electronics(),
              SizedBox(
                height: 5,
              ),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headline(dealine: "Fancy",),
                  InkWell(
      
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllFancy()));
                      
                    },
      
      
                    child: ViewButtons())
      
      
                  
                ],
              ),
              FancyPage(),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headline(dealine: "Jewellery",),
                   InkWell(
      
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllJewelery()));
                      
                    },
      
      
                    child: ViewButtons())
      
      
                  
                ],
              ),
              Jewellery(),
      
             
            ],
          ),
        ),
      ),
    );
  }
}



