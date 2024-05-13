import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sizer/sizer.dart';
import 'package:zizzia_e_commerce/controller/bloc/profilePage/profile_page_bloc.dart';
import 'package:zizzia_e_commerce/controller/functions/camera_gallery/cemara_gallery.dart';
import 'package:zizzia_e_commerce/controller/functions/edit_user/editUser.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';
import 'package:zizzia_e_commerce/view/pages/profile/common/text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  XFile? imagedata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 6.h,
        
        centerTitle: true,
        title: Text(
          "Edit profile",
          style: TextStyle(fontFamily: 'eurofighterexpandital'),
        ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              height: 1.h,
            ),
            Center(
              child: Stack(
                children: [
                  BlocBuilder<ProfilePageBloc, ProfilePageState>(
                    builder: (context, state) {
                     if(state is ProfilePageLoaded){
                      return CircleAvatar(
                        radius: 10.w,
                        backgroundImage: NetworkImage(
                          'http://$ip:3000/products-images/${state.list.data!.image}'),
                      );
                     }
                     else{return Image.asset("assets/on3.png");}
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 1.w,
                    child: CircleAvatar(
                      radius: 5.w,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  width: 30.w,
                                  height: 6.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          imagedata = await imageCam();
                                          ; 

                                          Navigator.of(context)
                                              .pop(); // Close the dialog after selecting an option
                                        },
                                        icon: Icon(
                                          Icons.camera,
                                          size: 50,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                      imagedata = await imageGallery();

                                          Navigator.of(context).pop();

                                          // Close the dialog after selecting an option
                                        },
                                        icon: Icon(Icons.photo, size: 50),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 15,
                          color: Color.fromARGB(255, 55, 224, 72),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ProfilePageBloc, ProfilePageState>(
              builder: (context, state) {
                if (state is ProfilePageLoaded) {
                  return Column(
                    children: [
                      Text(
                        state.list.data!.name ?? "Username".toString(),
                        style: 
                            TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        state.list.data!.email ?? "gmail".toString(),
                        style:
                            TextStyle(color: Color.fromARGB(255, 104, 99, 99)),
                      ),
                      
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFieldCommon(
                data: " Name",
                hintText: ' Enter your name',
                controller: nameController),
            TextFieldCommon(
                data: " Phone",
                hintText: '  Phone',
                controller: phoneController),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
               onPressed: () async {
  log('Name: ${nameController.text}');
  log('Phone: ${phoneController.text}');
  
  
  
  
  //
  await editWithImg(
      File(imagedata!.path), 
      phoneController.text,
      nameController.text,
    );

     BlocProvider.of<ProfilePageBloc>(context).add(ProflieSucess());

   
},
                child: Text(
                  'Save',
                  style:  TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'font1',
                    color:Colors.white,
                    fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(90.w, 8.h),
                    backgroundColor: Color.fromARGB(102, 57, 34, 1),),
              ),
            ),
          ]),
        ));
  }
}
