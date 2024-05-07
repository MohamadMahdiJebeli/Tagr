import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogListScreen_Controller.dart';

class BlogsListScreen extends StatelessWidget {
  BlogsListScreen({super.key});

  BlogListController blogListController = Get.put(BlogListController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;

    return Scaffold(
      //Appbar
      appBar: Appbar(size, textTheme,"Blogs"),
      //Body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(()=>
          SizedBox(
            child: ListView.builder(
              
              scrollDirection: Axis.vertical,
              itemCount: blogListController.blogsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.height/10,
                        width: size.width/4,
                        child: CachedNetworkImage(
                          imageUrl: blogListController.blogsList[index].image!, 
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
                              Text(blogListController.blogsList[index].title!,style: textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
                              
                              Row(
                                
                                children: [
                                  Text(blogListController.blogsList[index].author!,style: textTheme.headline6,),
                                  SizedBox(width: size.width/5,),
                                  Text(blogListController.blogsList[index].view!,style: textTheme.headline6,),
                                  const SizedBox(width: 5,),
                                  const Icon(Icons.remove_red_eye,color: SoidColor.colorDivider,size: 17,),
                                ],
                              )
                            ],
                          ),
                        )
                    ],
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