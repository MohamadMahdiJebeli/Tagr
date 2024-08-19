import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tagr/constant/api_constant.dart';
import 'package:tagr/constant/api_key_constans.dart';
import 'package:tagr/constant/commands.dart';
import 'package:tagr/constant/stroge_constant.dart';
import 'package:tagr/controller/uploadImageController.dart';
import 'package:tagr/models/podcastFileModel.dart';
import 'package:tagr/models/podcastModel.dart';
import 'package:tagr/services/dioService.dart';
import 'package:tagr/constant/api_constant.dart';

class ManagePodcastController extends GetxController {
  RxList<PodcastModel> podcastModel = RxList.empty();
  RxInt currentHourValue = 0.obs;
  RxInt currentMinuteValue = 0.obs;
  RxInt currentSecondeValue = 0.obs;
  Rx<PodcastsFileModel> podcastFileModel =
      PodcastsFileModel("Podcast Name").obs;

  // var selectedTime = TimeOfDay.now().replacing(hour: 0,minute: 0).obs;
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  

  RxInt? input = 0.obs;
  var userId = '';
  var catId = '';

  updateTitle() {
    podcastFileModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  titlePodcast() async {
    loading.value = true;
    Map<String, dynamic> map = {
      ApiPodcastTitleKyConstants.userId: GetStorage().read(StorageKey.userId),
      ApiPodcastTitleKyConstants.catId: catId,
      ApiPodcastTitleKyConstants.title: titleTextEditingController.text,
      ApiPodcastTitleKyConstants.command: Commands.storTitle,
    };
    var response =
        await DioService().postMethod(map, APIconstant.postPodcast);
    if (response.statusCode == 200) {
      const SnackBar(
        content: Text("Successful!"),
      );
    }
    loading.value = false;
  }

  filePodcast() async {
    var fileController = Get.find<UploadImageController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiPodcastFileKyConstants.title: podcastFileModel.value.title,
      ApiPodcastFileKyConstants.file:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiPodcastFileKyConstants.podcastId: podcastFileModel.value.podcastId,
      ApiPodcastFileKyConstants.command: Commands.storFile,
      ApiPodcastFileKyConstants.length: podcastFileModel.value.lenght,
    };
    var response =
        await DioService().postMethod(map, APIconstant.postPodcast);
  }

  UpdatePodcast() async {
    var fileController = Get.find<UploadImageController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiPodcastUpdateKyConstants.image:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiPodcastUpdateKyConstants.file: podcastFileModel.value.file,
      ApiPodcastUpdateKyConstants.podcastId: podcastFileModel.value.podcastId,
      ApiPodcastUpdateKyConstants.command: Commands.storUpdate,
      ApiPodcastUpdateKyConstants.userId: GetStorage().read(StorageKey.userId),
    };
    var response =
        await DioService().postMethod(map, APIconstant.postPodcast);
  }
}
