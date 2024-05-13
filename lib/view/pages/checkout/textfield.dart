// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController textController;
  String hintTextt;
  double hh;
  var ww;
  TextFieldWidget({
    Key? key,
    required this.textController,
    required this.hintTextt,
    required this.hh,
    this.ww,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey, width: 1)),
        height: hh.h,
       
      
        child: TextFormField(
          controller:textController,
      
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            
            border: InputBorder.none,
            hintText: "  $hintTextt",
            hintStyle: TextStyle(
                    
                    fontFamily: 'font1',
                 
                   
                    
                   ),
          ),
          
        
      ),),
    );
  }
}

class TextFieldWidget1 extends StatelessWidget {
  TextEditingController textController;
  String hintTextt;
  double hh;
  var ww;
  TextFieldWidget1({
    Key? key,
    required this.textController,
    required this.hintTextt,
    required this.hh,
    this.ww,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey, width: 1)),
        height: hh.h,
       
      
        child: TextFormField(keyboardType: TextInputType.number,
          controller:textController,
      
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            hintStyle: TextStyle(
                  
                    fontFamily: 'font1',
                   
                    fontWeight: FontWeight.w500),
            
            border: InputBorder.none,
            hintText: "  $hintTextt",
            
          ),
          
        
      ),),
    );
  }
}

