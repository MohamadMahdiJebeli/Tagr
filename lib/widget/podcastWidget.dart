import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/constant/string.dart';
import 'package:tagr/controller/podcast/singlePodcast_Controller.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/models/dataModels.dart';
import 'package:tagr/models/podcastModel.dart';


class PodcastEmpty extends StatelessWidget {
  const PodcastEmpty({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.images.botSadSticker.path,
          height: 120,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: string.PodcastEmpty,
                style: textTheme.headline2,
              )),
        ),
      ],
    ),
  );
  }
}



class PlayerManager extends StatelessWidget {
  const PlayerManager({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SinglePodcastController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 20,
      left: 20,
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
            timeLabelTextStyle: const TextStyle(color: Colors.white),
            thumbColor: Colors.yellow,
            baseBarColor: Colors.white,
            progressBarColor: Colors.grey,
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
                await controller.player.seekToNext();
                controller.currentFileIndex.value =
                    controller.player.currentIndex!;
                controller.timerCheck();
              },
              child: const Icon(
                Icons.skip_next,
                color: Colors.white,
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
                  color: Colors.white,
                  size: 66,
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
                color: Colors.white,
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
      ));
  }
}


class Titlee extends StatelessWidget {
  const Titlee({
    Key? key,
    required this.podcastModel,
    required this.textheme,
  }) : super(key: key);

  final PodcastModel podcastModel;
  final TextTheme textheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(15),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        podcastModel.title!,
        maxLines: 2,
        textAlign: TextAlign.start,
        style: textheme.titleLarge,
      ),
    ),
  );
  }
}


class FileList extends StatelessWidget {
  const FileList({
    Key? key,
    required this.controller,
    required this.textheme,
  }) : super(key: key);

  final SinglePodcastController controller;
  final TextTheme textheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(15),
    child: Obx(
      () => ListView.builder(
          itemCount: controller.podcastFileList.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return index < controller.podcastFileList.length - 1
     ? Padding(
         padding: EdgeInsets.all(15),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [
                 ImageIcon(
                   Image.asset(Assets.icons.podcast.path).image,
                   color: Colors.blue,
                 ),
                 SizedBox(
                   width: 15,
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
             Text(controller.podcastFileList[index].lenght! + ":00")
           ],
         ),
       )
     : Column(
         children: [
           Padding(
             padding: EdgeInsets.all(15),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     ImageIcon(
                       Image.asset(Assets.icons.podcast.path)
                           .image,
                       color: Colors.grey,
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
                 Text(controller.podcastFileList[index].lenght! +
                     ":00")
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
  );
  }
}

class Writer extends StatelessWidget {
  const Writer({
    Key? key,
    required this.podcastModel,
    required this.textheme,
  }) : super(key: key);

  final PodcastModel podcastModel;
  final TextTheme textheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Image(
          image: Image.asset(Assets.images.user.path).image,
          height: 32,
        ),
        SizedBox(
          width: 30,
        ),
         Text(
         podcastModel.author!,
          style: textheme.headline4,
          ),
        SizedBox(
          width: 30,
        )
      ],
    ),
  );
  }
}