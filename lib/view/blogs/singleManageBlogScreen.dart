import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogs/blogListScreen_Controller.dart';
import 'package:tagr/controller/blogs/manageBlogs_Controller.dart';
import 'package:tagr/controller/homeScreen_Controller.dart';
import 'package:tagr/controller/uploadImageController.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/services/pickFile.dart';
import 'package:tagr/view/blogs/blogContentEditor.dart';
import 'package:tagr/view/blogs/blogsListScreen.dart';
import 'package:tagr/view/blogs/manageBlogs.dart';

// ignore: must_be_immutable
class SingleManageBlogScreen extends StatelessWidget {
  SingleManageBlogScreen({super.key,});

  
  var manageBlogContoller = Get.find<ManageBlogsController>();
  UploadImageController uploadImageController = Get.put(UploadImageController());

  getTitle(){
    Get.defaultDialog(
      
      title: "Your Blog Title",
      
      titleStyle: const TextStyle(color: Colors.white),
      
      backgroundColor: SoidColor.colorSubject,
      
      content: TextField(
        controller: manageBlogContoller.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        decoration: const InputDecoration(
        fillColor: SoidColor.colorUnselectedText,
        filled: true, 
        hintText: "Title",hintStyle: TextStyle(color: Color.fromARGB(255, 80, 79, 79))
        ),
      ),

      confirm: ElevatedButton(
        onPressed: () {
          manageBlogContoller.updateTitle();
          Get.back();
        },
        child: const Text("Confirm"),)
    );
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(() =>
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height/3.5,
                    child: uploadImageController.file.value.name=='Nothing'?
                                    CachedNetworkImage(
                    imageUrl: manageBlogContoller.blogInfoModel.value.image!,
                    imageBuilder: (context, imageProvider) => SizedBox(
                      height: size.height/3.5,
                      child: Image(image: imageProvider,fit: BoxFit.cover,)),
                    placeholder: (context, url) => const loading(),
                    errorWidget: (context, url, error) => Image.asset(Assets.images.tagrLogo.path,fit: BoxFit.cover,height: size.height/4,)
                    ):Image.file(File(uploadImageController.file.value.path!),fit: BoxFit.cover,),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: size.height/4,
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
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: ImageIcon(Assets.icons.back.provider(),size: 25,)),
                        ]
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child:
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            pickFile();
                          },
                          child: Container(
                          height: size.height/20,
                          width: size.width/3,
                          decoration: const BoxDecoration(
                            color: SoidColor.colorSubject,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Center(child: Text("Select Picture +",style: textTheme.bodyText1,)),
                          ),
                        ),
                      )),
                ]
              ),
              const SizedBox(height: 25,),
              GestureDetector(
                onTap: () => getTitle(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(manageBlogContoller.blogInfoModel.value.title!,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 30),),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(BolgContentEditor()),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height/2,
                    width: size.width/1.2,
                    decoration:  const BoxDecoration(
                      color: Color.fromARGB(255, 240, 238, 238),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Center(
                      child: HtmlWidget(
                        manageBlogContoller.blogInfoModel.value.content!,textStyle: textTheme.headline6,
                      ),
                    ),
                  )
                ),
              ),
              const SizedBox(height: 25,),
              GestureDetector(
                onTap: () {
                  chooseCatsBottomSheet(textTheme);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height/20,
                          width: size.width/3,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: const Center(child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Select Category",style: TextStyle(color: Colors.white,fontSize: 15),),
                          )),
                        ),
                        const SizedBox(width: 10,),
                        Text(manageBlogContoller.blogInfoModel.value.catName==null?"You haven't chosen a category yet.":manageBlogContoller.blogInfoModel.value.catName!,style: textTheme.headline6,)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: ()async => await manageBlogContoller.storeBlog(),
                 
                 child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    manageBlogContoller.postBlogLoading.value?
                    "Posting...":
                    "Post Blog"),
                )),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
SizedBox Categories(TextTheme textTheme) {

  var homeScreenController = Get.find<HomeScreen_Controller>();

    return SizedBox(
              height: Get.height/1.9,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: homeScreenController.tagList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      manageBlogContoller.blogInfoModel.update((val) {
                        val?.catName = homeScreenController.tagList[index].title!;
                        val?.catId = homeScreenController.tagList[index].id!;
                      });
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 20,
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
                          child: Center(
                            child: 
                                Flexible(child: Center(child: Text(homeScreenController.tagList[index].title!,style: textTheme.bodyText1,overflow: TextOverflow.ellipsis,softWrap: false,maxLines: 2,)))
                          ),
                        ),
                      ),
                    ),
                  );
                }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5
                  ),), 
            );
  }


chooseCatsBottomSheet(TextTheme textTheme){
  Get.bottomSheet(
    Container(
      height: Get.height/1.5,
      width: Get.width,
      decoration: const BoxDecoration(
        color: SoidColor.colorView,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20), 
          )
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select Category",style: textTheme.headline1,),
          ),
          const SizedBox(height: 15,),
          Categories(textTheme),
        ],
      ),
    ),
    isScrollControlled: true,
    persistent: true,
  );
}
}

