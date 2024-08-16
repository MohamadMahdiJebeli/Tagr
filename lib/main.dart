// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tagr/route_manager/binding.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/my_http_overrides.dart';
import 'package:tagr/route_manager/pages.dart';
import 'package:tagr/view/blogs/manageBlogs.dart';
import 'package:tagr/view/blogs/singleManageBlogScreen.dart';
import 'package:tagr/view/homeScreen/home.dart';
import 'package:tagr/view/homeScreen/home_Screen.dart';
import 'package:tagr/view/blogs/singleBlogScreen.dart';
import 'package:tagr/view/podcasts/singlePodcastScreen.dart';
import 'package:tagr/view/splashScreen.dart';


Future<void> main() async {

  HttpOverrides.global=MyHttpOverrides();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en','fa'),

      //Themes
      theme: lightTheme(),
      getPages: Pages.pages,
      home: Splash_Screen(),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2)
        )
      ),
      //Elevated Bttn Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed)){
              return const TextStyle(fontSize: 22,fontFamily: "Nunito");
            }
            return const TextStyle(fontSize: 20,fontFamily: "Nunito");
          })
        )
      ),
      //Font Theme
      textTheme: TextTheme(
        headline1: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana', fontSize: 20,fontWeight: FontWeight.w700,color: SoidColor.colorTitleText),
        headline2: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana', fontSize: 20,fontWeight: FontWeight.w700,color: SoidColor.colorSubject),
        headline3: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana', fontSize: 18 ,fontWeight: FontWeight.w500,color: SoidColor.colorTitle),
        subtitle1: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana', fontWeight: FontWeight.w300,color: SoidColor.colorSubjectOnPage),
        bodyText1: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana',fontSize: 14, fontWeight: FontWeight.w500,color: SoidColor.colorTitleText),
        bodyText2: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana',fontSize: 16, fontWeight: FontWeight.w600,color: SoidColor.colorTitle),
        headline4: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana',fontSize: 30, fontWeight: FontWeight.bold,color: SoidColor.colorTitle),
        headline5: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana',fontSize: 17, fontWeight: FontWeight.w600,color: const Color.fromARGB(255, 0, 0, 0)),
        headline6: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana',fontSize: 17, fontWeight: FontWeight.w500,color: SoidColor.colorDivider),
        headlineLarge: TextStyle(fontFamily: window.locale.languageCode == 'fa' ? "Nunito":'dana',fontSize: 15,fontWeight: FontWeight.w500,color: SoidColor.colorTags),
      ),
    );
  }
}

class NamedRoute{
  
  NamedRoute._();

  static String routeHome = '/HomeScreen';
  static String routeSingleBlog = '/SingleBlogScreen';
  static String routeManageBlog = "/ManageBlog";
  static String routeSingleManageBlogScreen = "/SingleManageBlogScreen";
  static String routeSinglePodcast = "/SinglePodcastScreen";
}