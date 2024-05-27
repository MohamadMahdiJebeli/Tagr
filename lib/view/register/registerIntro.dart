// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/component/string.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});

  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: SweepGradient(
              center: Alignment.topLeft,
              colors: GradientColor.bottomNavBGColor)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height/4,),
              Image(image: Assets.images.botStickerPng.provider(),height: 100,),
          
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: string.welcome,
                    style: textTheme.headline2,
                  )
                ),
              ),
              SizedBox(height: size.height/3,),
              ElevatedButton(onPressed: (){
                //Bttm Sheet
                emailBttmSheet(context, size, textTheme);
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text("Lets Go!",),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> emailBttmSheet(BuildContext context, Size size, TextTheme textTheme) {

    return showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: size.height/3,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                          )
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(string.insertEmail,style: textTheme.headline5,),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: TextField(
                                controller: registerController.emailTextEditingController,
                                onChanged: (value) {
                                  // ignore: avoid_print, prefer_interpolation_to_compose_strings
                                  print(value+" is email "+isEmail(value).toString());
                                },
                                style: textTheme.headline5,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: string.exEmail,
                                  hintStyle: textTheme.headline6
                                ), 
                              ),
                            ),
                            ElevatedButton(
                            onPressed: () {
                              registerController.register();
                              Navigator.pop(context);
                              verifyBttmSheet(context, size, textTheme);
                            },
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: const Text("Next"),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },);
  }
  Future<dynamic> verifyBttmSheet(BuildContext context, Size size, TextTheme textTheme) {

    return showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: size.height/3,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                          )
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(string.insertVerifyCode,style: textTheme.headline5,),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: TextField(
                                controller: registerController.verifyTextEditingController,
                                onChanged: (value) {
                                },
                                style: textTheme.headline5,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: string.exVerifyCode,
                                  hintStyle: textTheme.headline6
                                ), 
                              ),
                            ),
                            ElevatedButton(
                            onPressed: () {
                              registerController.verify();
                            },
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: const Text("Next"),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },);
  }
}
