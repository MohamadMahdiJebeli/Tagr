// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/models/fakeData.dart';
import 'package:tagr/component/string.dart';
import 'package:tagr/view/homeScreen/home.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;
    double spaceWidth = size.width/10;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: spaceWidth,right: spaceWidth),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height/10,),
                    //Personal Info
                    SvgPicture.asset(Assets.images.botStickerSvg.path,height: size.height/7,),
                    SizedBox(height: size.height/40,),
                    const Text(string.successfulSignUp,style: TextStyle(fontSize: 17,color: SoidColor.colorSubject),textAlign: TextAlign.center,),
                    SizedBox(height: size.height/30,),
                    TextField(
                      // ignore: deprecated_member_use
                      style: textTheme.headline5,
                      decoration: InputDecoration(
                        hintText: "Your Name",
                        // ignore: deprecated_member_use
                        hintStyle: textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: size.height/10,),
                    //Favorite Categories
                    const Text(string.favCategory,style: TextStyle(fontSize: 17),),
                    SizedBox(height: size.height/40,),
                    SizedBox(
                      height: size.height/9,
                      width: double.infinity,
                
                      child: GridView.builder(
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.25
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains(tagList[index])) {
                                  selectedTags.add(tagList[index]);
                                }
                              });
                            },
                            child: MainTags(textTheme: textTheme, index: index));
                        },),
                    ),
                    SizedBox(height: size.height/60,),
                    Image.asset(Assets.icons.downArrow.path,scale: 8,),
                    SizedBox(height: size.height/40,),
                    SizedBox(
                      height: size.height/9,
                      width: double.infinity,
                
                      child: GridView.builder(
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.25
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 20,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              color: SoidColor.colorSelectedUpload
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedTags[index].title,style: textTheme.headlineLarge,),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    },
                                    child: ImageIcon(Assets.icons.remove.provider(),)
                                    )
                                ],
                              ),
                            ),
                          );
                        },),
                    ),
                    SizedBox(height: size.height/8,)
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));
                  },
                  child: const Text("Finish") 
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
