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
import 'package:tagr/models/dataModels.dart';
import 'package:just_audio/just_audio.dart';

class SinglePodcastScrren extends StatelessWidget {
  late SinglePodcastController singlePodcastController;
  late PodcastModel podcastModel;

  SinglePodcastScrren(){
    podcastModel=Get.arguments;
    singlePodcastController = Get.put(SinglePodcastController(id:podcastModel.id));
  }
  @override
  Widget build(BuildContext context) {

  print(singlePodcastController.id);
  var size = MediaQuery.of(context).size;
  
    return
     Scaffold(
      body:
       Stack(
         children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left:0,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                        CachedNetworkImage(
                          imageUrl: podcastModel.imageUrl,
                          imageBuilder: (context, imageProvider) => SizedBox(
                            height: size.height/2.5,
                            width: size.width,
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
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: ImageIcon(Assets.icons.back.provider(),size: 25,)),
                                      GestureDetector(
                                        onTap: () async {
                                          //await Share.share(singleBlogController.blogInfoModel.value.content.toString());
                                        },
                                        child: ImageIcon(Assets.icons.share.provider(),size: 25,)),
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
                              child:
                                  Text(podcastModel.speaker,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                                  ),
                            ),
                        ]
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(podcastModel.title,maxLines: 2,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 30),),
                      ),
                           
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            itemCount: singlePodcastController.podcastFileList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  await singlePodcastController.player.seek(Duration.zero,index: index);
                                  singlePodcastController.currentFileIndex.value = singlePodcastController.player.currentIndex!;
                                  singlePodcastController.selectedTitle = singlePodcastController.podcastFileList[index].title!;
                                  singlePodcastController.timerCheck();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(Assets.icons.playButton.path,scale: 22,color: SoidColor.colorSubject,),
                                          const SizedBox(width: 8,),
                                          Text(
                                            "Episode ${index + 1}",style: TextStyle(color: SoidColor.colorSubject,),
                                          ),
                                          const SizedBox(width: 10,),
                                          Obx(
                                            () => SizedBox(
                                              width: size.width/2.2,
                                              child: Text(singlePodcastController.podcastFileList[index].title!,style: singlePodcastController.currentFileIndex.value==index?const TextStyle(color: SoidColor.colorSubject):const TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,)),
                                          )
                                        ],
                                    ),
                                    Text(singlePodcastController.podcastFileList[index].lenght!+":00",overflow: TextOverflow.ellipsis,),
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
                Obx(
                  () => Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height/14,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gradient: LinearGradient(colors: GradientColor.bottomNavColor)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: size.width/2,
                                          child: 
                                          Text(singlePodcastController.selectedTitle,style: const TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,)
                                          ),
                                      ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                await singlePodcastController.player.seekToPrevious();
                                                singlePodcastController.currentFileIndex.value = singlePodcastController.player.currentIndex!;
                                                singlePodcastController.timerCheck();
                                              },
                                              child: Image.asset(Assets.icons.backButton.path,color: Colors.white,scale: 22)),
                                            const SizedBox(width: 8,),
                                            GestureDetector(
                                              onTap: () {
                                                if (singlePodcastController.player.playing) {
                                                singlePodcastController.player.pause();
                                                singlePodcastController.timer!.cancel(); 
                                                }else{
                                                  singlePodcastController.player.play();
                                                  singlePodcastController.startProgress();
                                                }        
                  
                  
                                                singlePodcastController.isPlaying.value = singlePodcastController.player.playing;
                  
                                                singlePodcastController.currentFileIndex.value = singlePodcastController.player.currentIndex!;
                                              },
                                              child: Obx(
                                                () => 
                                                singlePodcastController.isPlaying.value?
                                                const Icon(Icons.pause_circle_filled):
                                                Image.asset(Assets.icons.playCircle.path,color: Colors.white,scale: 20)
                                                )),
                                            const SizedBox(width: 8,),
                                            GestureDetector(
                                              onTap: () async {
                                                await singlePodcastController.player.seekToNext();
                                                singlePodcastController.currentFileIndex.value = singlePodcastController.player.currentIndex!;
                                                singlePodcastController.timerCheck();
                                              },
                                              child: Image.asset(Assets.icons.nextButton.path,color: Colors.white,scale: 22)),                                      
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                                //SizedBox(height: size.height/100,),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Obx(
                                    () => ProgressBar(
                                      progress: singlePodcastController.progressValue.value,
                                      total: singlePodcastController.player.duration??const Duration(seconds: 0),
                                      buffered: singlePodcastController.bufferedValue.value,
                                      timeLabelTextStyle: const TextStyle(color: Colors.white),
                                      onSeek: (position) {
                                        singlePodcastController.player.seek(position);
                  
                                        singlePodcastController.player.playing?
                                        singlePodcastController.startProgress():
                                        singlePodcastController.timer!.cancel();
                                      },
                                      ),
                                  )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                )
              ],
       ),
     );
  }
}