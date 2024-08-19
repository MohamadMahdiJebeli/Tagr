import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogs/blogListScreen_Controller.dart';
import 'package:tagr/controller/blogs/single_Blog_Controller.dart';
import 'package:tagr/controller/homeScreen_Controller.dart';
import 'package:tagr/main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class PodcastsListScreen extends StatelessWidget {
  PodcastsListScreen({required this.title,Key? key}): super(key: key);

  String title;

  HomeScreen_Controller homeScreen_Controller = Get.put(HomeScreen_Controller());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;


    return Scaffold(
      //Appbar
      appBar: appbar(size, textTheme,title),
      //Body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(()=>
          SizedBox(
            child: ListView.builder(
              
              scrollDirection: Axis.vertical,
              itemCount: homeScreen_Controller.topPodcastList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ( (){
                    Get.toNamed(NamedRoute.routeSinglePodcast,arguments: homeScreen_Controller.topPodcastList[index]);
                    }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ZoomTapAnimation(
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height/8,
                            width: size.width/3.5,
                            child: CachedNetworkImage(
                              imageUrl: homeScreen_Controller.topPodcastList[index].poster!, 
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                                    image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
                                  ),
                                );
                              },
                              placeholder: (context, url) => const loading(),
                            
                              errorWidget: (context, url, error) => const Icon(Icons.broken_image_outlined,color: Colors.grey,size: 50,),
                              ),
                          ),
                      
                            SizedBox(width: size.width/25,),
                      
                            SizedBox(
                              width: size.width/1.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // ignore: deprecated_member_use
                                  Text(homeScreen_Controller.topPodcastList[index].title!,style: textTheme.headline3,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
              ),
          ),
        ),
      ),
    );
  }
}