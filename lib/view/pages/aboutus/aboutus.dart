import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';




class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      

      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 5.h,),
            Text('About Zizzia',style:  TextStyle(
                              fontSize: 16.sp,
                              
                                fontFamily: 'font1',
                              ),),
           SizedBox(height: 5.h,),
            Text(
            
            'Welcome to Zizzia, your one-stop destination for all your shopping needs. We are dedicated to providing you with the very best of products, with a focus on quality, customer service, and uniqueness.\n\n'
            'Founded in 2024, Zizzia has come a long way from its beginnings. We now serve customers all over the world and are thrilled to be a part of the quirky, eco-friendly, fair trade wing of the fashion industry.\n\n'
            'We\'re dedicated to giving you the very best of products, with a focus on dependability, customer service, and uniqueness. We now serve customers all over the world, and are thrilled that we\'re able to turn our passion into our own website.\n\n'
            'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us.\n\n'
            'Sincerely,\n'
            'The Zizzia Team',
            style: TextStyle(
                               
                                fontSize: 14.sp,
                                fontFamily: 'font1',
                                fontWeight: FontWeight.bold
                              ),
          )
          
          ],),
        ),
      ),



    );
  }
}