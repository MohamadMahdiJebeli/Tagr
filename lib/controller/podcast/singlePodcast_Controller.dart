import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/constant/api_constant.dart';
import 'package:tagr/models/podcastFileModel.dart';
import 'package:tagr/services/dioService.dart';

class SinglePodcastController extends GetxController{
  
  var id;

  SinglePodcastController({this.id});

  RxBool Loading = false.obs;
  RxList<PodcastsFileModel> podcastFileList = RxList();
  late var playlist;
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  late RxInt currentFileIndex;

  var selectedTitle;  

  @override
  onInit() async {
    super.onInit();
    playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: []);
    getPodcastFile();
    await player.setAudioSource(playlist,
        initialIndex: 0, initialPosition: Duration.zero);
  }
  getPodcastFile() async{

    Loading.value=true;

    var response = await DioService().getMethod(APIconstant.getPodcastFile+id);

    if (response.statuscode==200) {
      for (var element in response.data["files"]) {
        podcastFileList.add(PodcastsFileModel.fromJson(element));

        playlist.add(AudioSource.uri(Uri.parse(PodcastsFileModel.fromJson(element).file!)));
      }
      Loading.value=false;
    }
  }

  Rx<Duration> progressValue = Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = Duration(seconds: 0).obs;
  Timer? timer;

  startProgress(){
    const tick = Duration(seconds: 1);
    int duartion = player.duration!.inSeconds - player.position.inSeconds;

    if (timer!=null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer=null;
      }
    }
    timer = Timer.periodic(tick, (timer) {
      duartion--;
      progressValue.value = player.position;
      bufferedValue.value = player.bufferedPosition;

      if (duartion<=0) {
        timer.cancel();
        progressValue.value = Duration(seconds: 0);
        bufferedValue.value = Duration(seconds: 0);
      }
    });

  }

timerCheck(){
  if (player.playing) {
    startProgress();
  }
}
}
