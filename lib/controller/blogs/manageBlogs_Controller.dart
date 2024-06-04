import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/constant/api_constant.dart';
import 'package:tagr/constant/commands.dart';
import 'package:tagr/constant/stroge_constant.dart';
import 'package:tagr/controller/uploadImageController.dart';
import 'package:tagr/models/articleModel.dart';
import 'package:tagr/models/blogInfoModel.dart';
import 'package:tagr/models/tagsModel.dart';
import 'package:tagr/services/dioService.dart';
import 'package:dio/dio.dart' as dio;

class ManageBlogsController extends GetxController{
  RxList<ArticleModel> blogList = RxList.empty();
  Rx<BlogInfoModel> blogInfoModel = BlogInfoModel("Title", "Write your Content here"," ").obs;
  RxList<TagsModel> relatedTagsEdit = RxList.empty();
  TextEditingController titleTextEditingController = TextEditingController();
  RxBool postBlogLoading = false.obs;

  @override
  onInit(){
    super.onInit();
    getManagedBlogs();
  }

  getManagedBlogs() async{

    var response = await DioService().getMethod(APIconstant.publishByMe+GetStorage().read(StorageKey.userId));

    if (response.statusCode==200){
      response.data.forEach((element){
        blogList.add(ArticleModel.fromJson(element));
      });

    }
  }

  updateTitle(){
    blogInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  storeBlog()async{
    postBlogLoading.value = true;


    var uploadImageController = Get.find<UploadImageController>();

    Map<String,dynamic> map = {
      APIBlogKeyConstant.title : blogInfoModel.value.title,
      APIBlogKeyConstant.content : blogInfoModel.value.content,
      APIBlogKeyConstant.catId : blogInfoModel.value.catId,
      APIBlogKeyConstant.userId : GetStorage().read(StorageKey.userId),
      APIBlogKeyConstant.image : await dio.MultipartFile.fromFile(uploadImageController.file.value.path!),
      APIBlogKeyConstant.command : Commands.store,
      APIBlogKeyConstant.tagList : "[]"
    };

    var response = await DioService().postMethod(map, APIconstant.blogPost);
    log(response.data.toString());
    postBlogLoading.value = false;
  }
}