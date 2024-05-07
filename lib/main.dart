// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/view/homeScreen/blogsListScreen.dart';
import 'package:tagr/view/splashScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Themes
      theme: ThemeData(
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
        textTheme: const TextTheme(
          headline1: TextStyle(fontFamily: "Nunito", fontSize: 20,fontWeight: FontWeight.w700,color: SoidColor.colorTitleText),
          headline2: TextStyle(fontFamily: "Nunito", fontSize: 20,fontWeight: FontWeight.w700,color: SoidColor.colorSubject),
          headline3: TextStyle(fontFamily: "Nunito", fontSize: 18 ,fontWeight: FontWeight.w500,color: SoidColor.colorTitle),
          subtitle1: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.w300,color: SoidColor.colorSubjectOnPage),
          bodyText1: TextStyle(fontFamily: "Nunito",fontSize: 14, fontWeight: FontWeight.w500,color: SoidColor.colorTitleText),
          bodyText2: TextStyle(fontFamily: "Nunito",fontSize: 16, fontWeight: FontWeight.w600,color: SoidColor.colorTitle),
          headline4: TextStyle(fontFamily: "Nunito",fontSize: 30, fontWeight: FontWeight.bold,color: SoidColor.colorTitle),
          headline5: TextStyle(fontFamily: "Nunito",fontSize: 17, fontWeight: FontWeight.w600,color: Color.fromARGB(255, 0, 0, 0)),
          headline6: TextStyle(fontFamily: "Nunito",fontSize: 17, fontWeight: FontWeight.w500,color: SoidColor.colorDivider),
          headlineLarge: TextStyle(fontFamily: "Nunito",fontSize: 15,fontWeight: FontWeight.w500,color: SoidColor.colorTags),
        ),
      ),
      home: BlogsListScreen(),
    );
  }
}
