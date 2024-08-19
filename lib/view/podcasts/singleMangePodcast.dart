import 'dart:io';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/controller/podcast/managePodcast_Controller.dart';
import 'package:tagr/controller/podcast/singlePodcast_Controller.dart';
import 'package:tagr/controller/uploadImageController.dart';
import 'package:tagr/services/pickFile.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleManagePodcast extends StatelessWidget {
  SinglePodcastController controller = Get.put(SinglePodcastController());
  ManagePodcastController managePodcastController =
      Get.put(ManagePodcastController());
  UploadImageController filePickerController = Get.put(UploadImageController());

  SingleManagePodcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(
                  (() => Column(children: [
                        Stack(
                          children: [
                            filePickerController.file.value.name == 'nothing'
                                ? SizedBox(
                                    width: Get.width,
                                    height: Get.height / 3,
                                    child: CachedNetworkImage(
                                      // imageUrl: managePodcastController.podcastFileModel.value.,
                                      imageUrl:
                                          "",
                                      imageBuilder: ((context, imageProvider) =>
                                          Image(image: imageProvider)),
                                      placeholder: ((context, url) =>
                                          const loading()),
                                      errorWidget: ((context, url, error) =>
                                          const Icon(Icons.broken_image_outlined,color: Colors.grey,size: 50)
                                          ),
                                    ),
                                  )
                                : Image.file(
                                    File(filePickerController.file.value.path!),
                                    fit: BoxFit.cover,
                                  ),
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 90,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          end: Alignment.bottomCenter,
                                          begin: Alignment.topCenter,
                                          colors: GradientColor.tagsColor)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 45,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      //pickFile
                                      pickFile();
                                    },
                                    child: Container(
                                      height: 60,
                                      width: Get.width / 3,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                12),
                                            topRight: Radius.circular(
                                                12),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Select Your Image",
                                            style: textheme.headline2,
                                          ),
                                          const Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        GestureDetector(
                          onTap: (() {
                            getTitle();
                          }),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 20),
                            child:  Padding(
                              padding: EdgeInsets.only(right: 12, bottom: 8),
                              child: Row(
                              children: [
                            ImageIcon(  
                              Image.asset(Assets.icons.add.path).image,
                              color: Colors.blue,
                            ),
                            const SizedBox(   
                              width: 8,
                            ),
                            Text( 
                            "Add Title",
                            )
                            ],
                            ),
                            ),
                            // (
                            //   bodyMargin: Dimens.bodyMargin / 2,
                            //   textTheme: textheme,
                            //   title: MyStrings.editTitlePodcast,
                            // ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            managePodcastController
                                .podcastFileModel.value.title!,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (() {
                            bottomSheet(textheme);
                          }),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 20),
                            child:  Padding(
                              padding: EdgeInsets.only(right: 12, bottom: 8),
                              child: Row(
                              children: [
                            ImageIcon(  
                              Image.asset(Assets.icons.add.path).image,
                              color: Colors.blue,
                            ),
                            const SizedBox(   
                              width: 8,
                            ),
                            Text( 
                            "Add Title",
                            )]))),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: 12,
                                    left: 12,
                                    top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ImageIcon(
                                          Image.asset(
                                                  Assets.icons.podcast.path)
                                              .image,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          " simple",
                                          style: textheme.headline4,
                                        ),
                                      ],
                                    ),
                                   
                                    Text(
                                        // '${managePodcastController.currentHourValue.value}:${managePodcastController.currentMinuteValue.value}:${managePodcastController.currentSecondeValue.value}',
                                        // style: const TextStyle(
                                        //     color: Colors.black)
                                        "")
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ])),
                )),
          ),
          Positioned(
            bottom: 15,
            right: 25,
            left: 25,
            child: Container(
              height: Get.height / 7,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: GradientColor.bottomNavColor,
              ),
            ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => ProgressBar(
                          timeLabelTextStyle:
                              const TextStyle(color: Colors.grey),
                          thumbColor: Colors.amber,
                          baseBarColor: Colors.grey,
                          buffered: controller.bufferState.value,
                          progressBarColor: Colors.green,
                          progress: controller.progressState.value,
                          onSeek: (position) {
                            controller.player.seek(position);

                            controller.player.playing
                                ? controller.startProgress()
                                : controller.timer!.cancel();
                          },
                          total: controller.player.duration ??
                              const Duration(seconds: 0)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await controller.player.seekToNext();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                            controller.timerCheck();
                          },
                          child: const Icon(
                            Icons.skip_next,
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.player.playing
                                ? controller.timer!.cancel()
                                : controller.startProgress();

                            controller.player.playing
                                ? controller.player.pause()
                                : controller.player.play();

                            controller.playState.value =
                                controller.player.playing;

                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                          },
                          child: Obx(
                            () => Icon(
                              controller.playState.value
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill,
                              color: Colors.grey,
                              size: 48,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.player.seekToPrevious();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                            controller.timerCheck();
                          },
                          child: const Icon(
                            Icons.skip_previous,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.setLoopMode();
                            },
                            child: Icon(
                              Icons.repeat,
                              color: controller.isLoopAll.value
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  getTitle() {
    Get.defaultDialog(
      title: "Select a Title",
      titleStyle: const TextStyle(color: Colors.black),
      content: TextField(
        controller: managePodcastController.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: "Write Here",
          fillColor: Colors.grey,
        ),
      ),
      backgroundColor: Colors.black87,
      radius: 15,
      confirm: Row(
        children: [
          TextButton(
              onPressed: () {
                managePodcastController.updateTitle();
              },
              child: const Text(
                "Verify",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Later",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  bottomSheet(TextTheme textheme) {
    Get.bottomSheet(
      Container(
        height: Get.height / 2.2,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)),
          color: Colors.greenAccent,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.asset(Assets.icons.file.path,height: 32,),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30,
                      right: 50,
                      top: 20),
                  child: SvgPicture.asset(
                    Assets.images.tagrLogo.path,
                    height: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 60, top: 50),
                  child: Text(
                    "Please enter the time and file of the new podcast episode",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await audioFile();
                    },
                    child: Column(
                      children: [
                        Assets.icons.podcast.image(
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Select Audio',
                          style: textheme.headlineMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Obx(
                    () => Column(
                      children: [
                        SizedBox(
                          height: Get.height / 6,
                          width: 60,
                          child: NumberPicker(
                            haptics: true,
                            minValue: 0,
                            maxValue: 60,
                            value: managePodcastController
                                .currentSecondeValue.value,
                            onChanged: (value) => managePodcastController
                                .currentSecondeValue.value = value,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('ثانیه'),
                      ],
                    ),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(fontSize: 25),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        SizedBox(
                          height: Get.height / 6,
                          width: 60,
                          child: NumberPicker(
                            haptics: true,
                            minValue: 0,
                            maxValue: 60,
                            value: managePodcastController
                                .currentMinuteValue.value,
                            onChanged: (value) => managePodcastController
                                .currentMinuteValue.value = value,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Minutes'),
                      ],
                    ),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(fontSize: 25),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        SizedBox(
                          height: Get.height / 6,
                          width: 60,
                          child: NumberPicker(
                            haptics: true,
                            minValue: 0,
                            maxValue: 12,
                            value:
                                managePodcastController.currentHourValue.value,
                            onChanged: (value) => managePodcastController
                                .currentHourValue.value = value,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('ساعت'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(Get.width / 3, 45))),
                onPressed: (() async {
                  await managePodcastController.titlePodcast();
                  await managePodcastController.filePodcast();
                  await managePodcastController.UpdatePodcast();
                }),
                child: Text(
                  "Verify",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
