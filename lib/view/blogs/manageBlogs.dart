// ignore_for_file: file_names, deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogs/manageBlogs_Controller.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/constant/string.dart';
import 'package:tagr/main.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class ManageBlogs extends StatelessWidget {
  ManageBlogs({super.key});

  var manageBlogController = Get.find<ManageBlogsController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appbar(size, textTheme,"Blog Management"),
      body: Obx(()=>
      
      manageBlogController.blogList.isNotEmpty ?
          SizedBox(
            child: ListView.builder(
              
              scrollDirection: Axis.vertical,
              itemCount: manageBlogController.blogList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ( (){

                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height/10,
                          width: size.width/4,
                          child: CachedNetworkImage(
                            imageUrl: manageBlogController.blogList[index].image!, 
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
                                Text(manageBlogController.blogList[index].title!,style: textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                
                                Row(
                                  
                                  children: [
                                    Text(manageBlogController.blogList[index].author!,style: textTheme.headline6,),
                                    SizedBox(width: size.width/5,),
                                    Text(manageBlogController.blogList[index].view!,style: textTheme.headline6,),
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
          ):blogEmptyState(size, textTheme, context)
        ),
        bottomNavigationBar: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style:ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(Get.width/3, 56))),
            onPressed: (){
              Get.toNamed(NamedRoute.routeSingleManageBlogScreen);
              },
              child: const Text("Add Blog",),
              ),
        ),
    );
  }

  Widget blogEmptyState(Size size, TextTheme textTheme, BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height/4,),
            Image(image: Assets.images.botSadSticker.provider(),height: 100,),
        
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: string.blogEmpty,
                  style: textTheme.headline2,
                )
              ),
            ),
            SizedBox(height: size.height/3,),
          ],
        ),
      ),
    );
  }
}
