import 'package:get/get.dart';
import 'package:tagr/component/api_constant.dart';
import 'package:tagr/models/articleModel.dart';
import 'package:tagr/models/podcastModel.dart';
import 'package:tagr/models/posterModel.dart';
import 'package:tagr/models/tagsModel.dart';
import 'package:tagr/services/dioService.dart';

// ignore: camel_case_types
class HomeScreen_Controller extends GetxController{
  Rx<PosterModel> posterModel = PosterModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxBool homeScreenLoading = true.obs;

  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async{
    var response = await DioService().getMethod(APIconstance.getHomeItems);
    homeScreenLoading.value = true;

      if (response.statusCode==200) {
       response.data['top_visited'].forEach((element){
        topVisitedList.add(ArticleModel.fromJson(element));
      }); 
      response.data['top_podcasts'].forEach((element){
        topPodcastList.add(PodcastModel.fromJson(element));
      });
      response.data['tags'].forEach((element){
        tagList.add(TagsModel.fromJson(element));
      });
      posterModel.value=PosterModel.fromJson(response.data['poster']);

      homeScreenLoading.value = false;
      }
  }
}