// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/view/homeScreen/home.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget{
  Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {

  RegisterController registerController = Get.put(RegisterController(),permanent: false);

  @override
  void initState(){
    Future.delayed(const Duration(seconds: 2),).then((value) => 
    registerController.firstOpen()
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 77, 77, 77),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: Assets.images.tagrLogo.provider()),
                const SpinKitThreeBounce(
                color: SoidColor.colorLoading,
                size: 35.0,
                ),
              ],
            ),
            Positioned(
              bottom: size.height/15,
              right: 0,
              left: 0,
              child: 
              Column(
                children: [
                  const Text("Developed by",style: TextStyle(fontSize: 15,color: SoidColor.colorLoading,fontWeight: FontWeight.w300),),
                  SizedBox(height: size.height/70,),
                  ImageIcon(Assets.images.mJ21NoBg.provider(),color:SoidColor.colorLoading,size: size.height/24,),
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}