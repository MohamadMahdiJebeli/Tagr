import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogs/blogListScreen_Controller.dart';
import 'package:tagr/controller/blogs/single_Blog_Controller.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/view/blogs/blogsListScreen.dart';

// ignore: must_be_immutable
class SingleBlogScreen extends StatelessWidget {
  SingleBlogScreen({super.key,});

  var singleBlogController = Get.find<SingleBlogController>();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;


    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(() => singleBlogController.blogInfoModel.value.title==null?
          SizedBox(
            height: size.height,
            child: const loading()
            ): 
          Column(
            children: [
              Stack(
                children: [
                CachedNetworkImage(
                  imageUrl: singleBlogController.blogInfoModel.value.image!,
                  imageBuilder: (context, imageProvider) => SizedBox(
                    height: size.height/3,
                    child: Image(image: imageProvider,fit: BoxFit.cover,)),
                  placeholder: (context, url) => const loading(),
                  errorWidget: (context, url, error) => Image.asset(Assets.images.tagrLogo.path,fit: BoxFit.cover,)
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
                              GestureDetector(
                                onTap: () async {
                                  await Share.share(singleBlogController.blogInfoModel.value.content.toString());
                                },
                                child: ImageIcon(Assets.icons.share.provider(),size: 25,)),
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
                          Text(singleBlogController.blogInfoModel.value.author!,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                          const SizedBox(width: 16,),
                          Text(singleBlogController.blogInfoModel.value.createdAt!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Color.fromARGB(255, 58, 58, 58)),)
                          ],
                          ),
                          ),
                    ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(singleBlogController.blogInfoModel.value.title!,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                  singleBlogController.blogInfoModel.value.content!
                )
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: singleBlogController.relatedTags.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        var tagids =singleBlogController.relatedTags[index].id!;
                        await Get.find<BlogListController>().getBlogListTags(tagids);

                        var tagName = singleBlogController.relatedTags[index].title!;
                        Get.to(BlogsListScreen(title: tagName));
                      },
                      child: Padding(
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
                                // ignore: deprecated_member_use
                                Text(singleBlogController.relatedTags[index].title!,style: textTheme.bodyText1)
                              ],
                            ),
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
                  // ignore: deprecated_member_use
                  child: Text("Related blogs",style: textTheme.headline2,)),
              ),
              const SizedBox(height: 5,),
              SizedBox(
                height: size.height/3.5,
          
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                              singleBlogController.getBlogInfo(singleBlogController.relatedBlogs[index].id);
                            },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(index==0?15:8, 0, 8, 8),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height/5.2,
                                  width: size.width/2.5,
                                              
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: singleBlogController.relatedBlogs[index].image!,
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
                                                // ignore: deprecated_member_use
                                                singleBlogController.relatedBlogs[index].author!,style: textTheme.subtitle1,overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(Icons.remove_red_eye,color: SoidColor.colorSubjectOnPage,size: 17,),
                                                  const SizedBox(width: 2,),
                                                  // ignore: deprecated_member_use
                                                  Text(singleBlogController.relatedBlogs[index].view!,style: textTheme.subtitle1,overflow: TextOverflow.ellipsis,)
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
                                  // ignore: deprecated_member_use
                                  child: Text(singleBlogController.relatedBlogs[index].title!,overflow: TextOverflow.ellipsis,maxLines: 2,style: textTheme.headline3,),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      ),
                      
                ),
                
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}