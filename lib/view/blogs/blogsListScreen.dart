import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogs/blogListScreen_Controller.dart';
import 'package:tagr/controller/blogs/single_Blog_Controller.dart';

// ignore: must_be_immutable
class BlogsListScreen extends StatelessWidget {
  BlogsListScreen({required this.title,Key? key}): super(key: key);

  String title;

  BlogListController bloglistController = Get.put(BlogListController());

  SingleBlogController singleBlogController = Get.put(SingleBlogController());

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
              itemCount: bloglistController.blogsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ( (){
                    singleBlogController.getBlogInfo(bloglistController.blogsList[index].id);
                    }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height/10,
                          width: size.width/4,
                          child: CachedNetworkImage(
                            imageUrl: bloglistController.blogsList[index].image!, 
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
                                Text(bloglistController.blogsList[index].title!,style: textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                
                                Row(
                                  
                                  children: [
                                    // ignore: deprecated_member_use
                                    Text(bloglistController.blogsList[index].author!,style: textTheme.headline6,),
                                    SizedBox(width: size.width/5,),
                                    // ignore: deprecated_member_use
                                    Text(bloglistController.blogsList[index].view!,style: textTheme.headline6,),
                                    const SizedBox(width: 5,),
                                    const Icon(Icons.remove_red_eye,color: SoidColor.colorDivider,size: 17,),
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
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