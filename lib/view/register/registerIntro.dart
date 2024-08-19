// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/constant/stroge_constant.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/constant/string.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatefulWidget {
  const RegisterIntro({super.key});

  @override
  State<RegisterIntro> createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  var registerController = Get.find<RegisterController>();
  final TextEditingController _emailController = TextEditingController();
  bool emailCheck=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadEmail();
    emailCheck;
  }

  void _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    if (storedEmail != null) {
      setState(() {
        emailAc = storedEmail;
        _emailController.text=emailAc;
      });
    }
  }

  void _saveEmail(String Email) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', Email);
    setState(() {
      emailAc = Email;
    });
  }

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
                                keyboardType: TextInputType.emailAddress,
                                controller: registerController.emailTextEditingController,
                                onChanged: (value) {
                                  // ignore: avoid_print, prefer_interpolation_to_compose_strings
                                  print(value+" is email "+isEmail(value).toString());
                                  if (isEmail(value)==true) {
                                    emailCheck=true;
                                  }else{
                                    emailCheck=false;
                                  }
                                  print(emailCheck);
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
                              if (emailCheck==true) {
                                emailAc=_emailController.text;
                                _saveEmail(emailAc);
                                registerController.register();
                                Navigator.pop(context);
                                verifyBttmSheet(context, size, textTheme);
                              } else {
                                Get.snackbar("The Email is incorrecrt", "Please enter the correct email",backgroundGradient: const LinearGradient(colors: GradientColor.errorColors),);
                              }
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
