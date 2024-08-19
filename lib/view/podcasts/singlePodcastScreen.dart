import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/controller/podcast/singlePodcast_Controller.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tagr/models/podcastModel.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


// ignore: must_be_immutable
class SinglePodcastScrren extends StatelessWidget {
  late SinglePodcastController controller;
  late PodcastModel podcastModel;
  SinglePodcastScrren({Key? key}) : super(key: key) {
    podcastModel = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podcastModel.id));
  }

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
              child: Column(children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Get.height / 2.5,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: podcastModel.poster!,
                        imageBuilder: ((context, imageProvider) => Image(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            )),
                        placeholder: ((context, url) => const loading()),
                        errorWidget: (context, url, error) => const Icon(Icons.broken_image_outlined,color: Colors.grey,size: 50),
                      ),
                      
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: Get.size.height/11,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: GradientColor.bottomNavBGColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () async {
                                      await controller.player
                                          .stop();
                                      controller.startProgress();
                                      controller.progressState
                                          .value = const Duration(seconds: 0);
                                      controller
                                          .selectedIndex.value = 0;
                                      Get.back();
                                    },
                                child: ZoomTapAnimation(
                                  child: ImageIcon(Assets.icons.back.provider(),size: 25,))                              ),
                              const Expanded(child: SizedBox()),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        )),
                        Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child:
                              Container(
                              height: Get.height/11,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: GradientColor.posterBGTitle)
                              ),)),
                  Positioned(
                    bottom: 0,
                    left: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.size.width/30,
                          ),
                          Text(
                          podcastModel.author!,
                          style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                        ],
                      ),
                    ),
                  ),    
                                      
                  ],
                ),

                //title
                Padding(
                    padding: const EdgeInsets.all(18),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        podcastModel.title!,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 30),
                      ),
                    ),
                  ),
                                //writer
                
                //file list
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller.podcastFileList.length,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return index < controller.podcastFileList.length
                    ? Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(Assets.icons.playButton.path,scale: 22,color: SoidColor.colorSubject,),
                                          const SizedBox(width: 10,),
                                          Text(
                                            "Episode ${index + 1} ",style: const TextStyle(color: SoidColor.colorSubject,fontSize: 12),
                                          ),
                                          const SizedBox(width: 5,),
                                          Obx(
                                            () => SizedBox(
                                              width: Get.size.width/1.9,
                                              child: Text(controller.podcastFileList[index].title!,style: controller.currentFileIndex.value==index?const TextStyle(color: Color.fromARGB(255, 0, 83, 66)):const TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,)),
                                          )
                              ],
                            ),
                            Text("${controller.podcastFileList[index].lenght!} Min",style: const TextStyle(fontSize: 10),)
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      Image.asset(Assets.icons.podcast.path)
                                          .image,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.5,
                                      child: Text(
                                        controller.podcastFileList[index].title!,
                                        style: textheme.headline4,
                                      ),
                                    ),
                                  ],
                                ),
                                Text("${controller.podcastFileList[index].lenght!}:00")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 1.4,
                          )
                        ],
                      );
                          })),
                    ),
                  ),              ]),
                            ),
                          ),

            //player manager
            Positioned(
                  bottom: 15,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: Get.height / 7,
                    decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          gradient: LinearGradient(
                            colors: GradientColor.bottomNavColor,
                          ),
                        ),
                    child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => ProgressBar(
                        timeLabelTextStyle: const TextStyle(color: Colors.white),
                        thumbColor: const Color.fromARGB(255, 0, 38, 30),
                        baseBarColor: Colors.grey,
                        progressBarColor: const Color.fromARGB(255, 0, 59, 46),
                        buffered: controller.bufferState.value,
                        progress: controller.progressState.value,
                        total:
                            controller.player.duration ?? const Duration(seconds: 0),
                        onSeek: (position) async {
                          controller.player.seek(position);

                          if (controller.player.playing) {
                            controller.startProgress();
                          } else if (position <= const Duration(seconds: 0)) {
                            await controller.player.seekToNext();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                            controller.timerCheck();
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await controller.player.seekToPrevious();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                            controller.timerCheck();
                          },
                          child: const Icon(
                            Icons.skip_previous,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 40,
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

                            controller.playState.value = controller.player.playing;
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                          },
                          child: Obx(
                            () => Icon(
                              controller.playState.value
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 60,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.player.seekToNext();
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                            controller.timerCheck();
                          },
                          child: const Icon(
                            Icons.skip_next,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 40,
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
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                    ),
                  ))   ],
                  )),
                );
              }
            }







