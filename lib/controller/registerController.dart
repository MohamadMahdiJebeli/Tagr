import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tagr/component/api_constant.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/stroge_constant.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/main.dart';
import 'package:tagr/services/dioService.dart';
import 'package:tagr/view/homeScreen/home.dart';
import 'package:tagr/view/register/registerIntro.dart';
import 'package:tagr/view/register/userInfo.dart';
import 'package:tagr/view/splashScreen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController verifyTextEditingController = TextEditingController();

  var email = '';
  var user_id='';

  register() async{
    Map<String,dynamic> map={
      'email':emailTextEditingController.text,
      'command':'register'
    };
    var response=await DioService().postMethod(map, APIconstance.postRegister);
    email = emailTextEditingController.text;
    user_id = response.data['user_id'];
  }

  verify() async{
    Map<String,dynamic> map={
      'email':email,
      'user_id':user_id,
      'code':verifyTextEditingController.text,
      'command':'verify',
    };

    print(map);

    var response=await DioService().postMethod(map, APIconstance.postRegister);

    print(response.data);

    var status = response.data['response'];

    switch(status){
      case 'verified':
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(user_id, response.data['user_id']);

      Get.offAll(const UserInfo());
      break;

      case 'incorrect_code':
      Get.snackbar("Incorrect Code", "The code is incorrect");
      break;

      case 'expired':
      Get.snackbar("Expired", "The code has expired");
      break;
    }
  }

  checkLogin(){
    if (GetStorage().read(token)==null) {
      Get.to(RegisterIntro());
    }else{
      addBottomSheet();
    }
  }

  firstOpen(){
    if (GetStorage().read(token)==null) {
      Get.offAll(RegisterIntro());
    }else{
      Get.offAllNamed(NamedRoute.routeHome);
    }
  }
  addBottomSheet(){
    Get.bottomSheet(
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: Get.height/7,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: GradientColor.addBottomSheet,),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: 
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(NamedRoute.routeManageBlog);
                  },
                  child: Column(
                    children: [
                      Image.asset(Assets.icons.blogs.path,scale: 12,),
                      const SizedBox(height: 15,),
                      const Text("Blogs",style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Column(
                    children: [
                      Image.asset(Assets.icons.podcast.path,scale: 12,),
                      const SizedBox(height: 15,),
                      const Text("Podcasts",style: TextStyle(color: Colors.black),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
      
      );
  }
}