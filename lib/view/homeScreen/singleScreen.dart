import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/models/fakeData.dart';

class SingleScreen extends StatelessWidget {
  const SingleScreen({super.key,});


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;


    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
              CachedNetworkImage(
                imageUrl: "",
                imageBuilder: (context, imageProvider) => Container(
                  height: size.height/2,
                  child: Image(image: imageProvider,fit: BoxFit.cover,)),
                placeholder: (context, url) => const loading(),
                errorWidget: (context, url, error) => Container(
                  height: size.height/3,
                  child: Image.asset(Assets.images.podTestImg.path,fit: BoxFit.cover,))
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: size.height/5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: GradientColor.bottomNavBGColor)
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(Assets.icons.back.provider(),size: 25,),
                        Row(
                          children: [
                            ImageIcon(Assets.icons.heart.provider(),size: 25,),
                            const SizedBox(width: 11,),
                            ImageIcon(Assets.icons.share.provider(),size: 25,),
                          ]
                        )
                      ]
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child:
                    Container(
                    height: size.height/11,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: GradientColor.posterBGTitle)
                    ),
                  )),
                  Positioned(
                    bottom: 0,
                    left: 5,
                    child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Image(image: AssetImage(Assets.images.user.path,),
                        height: size.height/20, 
                        ),
                        const SizedBox(width: 10,),
                        const Text("Fatemeh Amiri",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                        const SizedBox(width: 16,),
                        const Text("2 Days Ago",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Color.fromARGB(255, 58, 58, 58)),)
                        ],
                        ),
                        ),
                  ),
              ]
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Secrets of Assassin's Creed Valhalla; From Harry Potter and Lord of the Rings to Dark Souls",maxLines: 2,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("""A few months ago, the latest installment of the Assassin's Creed series was released. Assassin's Creed Valhalla narrates the story of historical assassins in the land of the Vikings and has a significant difference from the main games of this series. However, what is present in this game and has always been present in other games of this series as well is a large amount of hidden content and peculiar secrets. We intend to take a look at them so that if you haven't seen them, you won't miss out.
            
These days, the Assassin's Creed series games bear more resemblance to role-playing games than Assassin's Creed itself. The gameplay of these games has changed significantly, and many role-playing elements have been added to them. Assassin's Creed Valhalla, like many large-scale role-playing games, has expanded greatly, and sweeping through its vast world requires more than a hundred hours. Within this large map, there are many hidden points referred to as "Easter Eggs" in gamer communities."""),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(index==0?21:8, 8, 8, 8),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                    
                        gradient: LinearGradient(
                          colors: GradientColor.tagsColor,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft
                          )
                      ),
                    
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ImageIcon(Assets.icons.hashtags.provider(),color: Colors.white,size: 14,),
                            const SizedBox(width: 6,),
                            Text(tagList[index].title,style: textTheme.bodyText1)
                          ],
                        ),
                      ),
                    ),
                  );
                },), 
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text("Related blogs",style: textTheme.headline2,)),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: size.height/3.5,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(index==0?15:8, 0, 8, 8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height/5.2,
                              width: size.width/2.5,
                                          
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: blogList[index].imageUrl,
                                    imageBuilder: (context, imageProvider) => 
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:  const BorderRadius.all(Radius.circular(16)),
                                        image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
                                      ),
                                      foregroundDecoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                        gradient: LinearGradient(
                                          begin: AlignmentDirectional.topCenter,
                                          end: AlignmentDirectional.bottomCenter,
                                          colors: GradientColor.posterMainHomeColor)
                                      ),
                                    ),
                                    placeholder: (context, url) => const loading(),
                                    errorWidget: (context, url, error) => const Icon(Icons.broken_image_outlined,color: Colors.grey,size: 50),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      right: 8,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            blogList[index].writer,style: textTheme.subtitle1,overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.remove_red_eye,color: SoidColor.colorSubjectOnPage,size: 17,),
                                              const SizedBox(width: 2,),
                                              Text(blogList[index].views,style: textTheme.subtitle1,overflow: TextOverflow.ellipsis,)
                                            ],
                                          )
                                        ],
                                      )
                                      )
                                ],
                              ),
                            ),
                            const SizedBox(height: 6,),
                            SizedBox(
                              width: size.width/2.5,
                              child: Text(blogList[index].title,overflow: TextOverflow.ellipsis,maxLines: 2,style: textTheme.headline3,),
                            )
                          ],
                        ),
                      );
                    },
                    ),
                    
              ),
              
            ),
            
          ],
        ),
      ),
    );
  }
}