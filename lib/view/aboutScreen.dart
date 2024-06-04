import 'package:flutter/material.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/constant/string.dart';
import 'package:tagr/gen/assets.gen.dart';

class AboutScreen extends StatelessWidget{
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;
    double spaceWidth = size.width/10;
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: const Text("About"),
      ),
      body: Padding(
        padding: EdgeInsets.all(spaceWidth),
        child:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            colors: GradientColor.bottomNavBGColor,
            begin: Alignment.center ,
            end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
          height: size.height*80/100,
          width: size.width*80/100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(string.about),
                  SizedBox(height: size.height/25,),
                  ImageIcon(Assets.images.mJ21NoBg.provider(),size: 27,),
                  SizedBox(height: size.height/15,),
                  Text(string.notice,style: textTheme.headlineLarge,)
                ],
              ),
            ),
          )
          ),
        ),
      ));
  }

}