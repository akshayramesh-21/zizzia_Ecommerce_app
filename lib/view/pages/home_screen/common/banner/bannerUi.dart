  
  
   import 'dart:developer';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/banner/banner_bloc.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';



class BannerUi extends StatefulWidget {
  const BannerUi({super.key});

  @override
  State<BannerUi> createState() => _BannerUiState();
}

class _BannerUiState extends State<BannerUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
 

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
              builder: (context, state) {
                if(state is BannerLoading){
                  return Container(width: 100,height: 100,color: Colors.lightGreenAccent,);
                }
                if (state is BannerLoaded) {
                  log(  '  banner loaded ui');
                  return Container(
                    width: 100.w,
                    height: 25.h,
                    child: Swiper(
                        loop: true,
                        autoplay: true,
                        pagination: const SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                color: Color.fromARGB(255, 25, 174, 201),
                                activeColor:
                                    Color.fromARGB(255, 255, 255, 255))),
                        control: SwiperControl(color: Colors.transparent),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                           
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:  NetworkImage( 'http://$ip:3000/products-images/${state.bannerItems[index].image}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return SizedBox();
                }
              },
            );
  }
}