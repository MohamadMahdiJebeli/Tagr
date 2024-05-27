import 'package:get/get.dart';
import 'package:tagr/component/api_constant.dart';
import 'package:tagr/models/articleModel.dart';
import 'package:tagr/services/dioService.dart';

class BlogListController extends GetxController{
  RxList<ArticleModel> blogsList = RxList();

  RxBool bloglistloading=false.obs;
  
  @override
  void onInit() {
    super.onInit();
    getBlogsList();
  }

  getBlogsList() async{
    blogsList.clear();

    bloglistloading.value==true;

    var response = await DioService().getMethod(APIconstance.getBlogsList);

    if (response.statusCode==200) {
      response.data.forEach((element){
        blogsList.add(ArticleModel.fromJson(element));
      });
    }
    bloglistloading.value==false;
  }

  getBlogListTags(String tagID) async{

    blogsList.clear();

    bloglistloading.value== true;

    var response = await DioService().getMethod('${APIconstance.baseURL}article/get.php?command=get_articles_with_tag_id&tag_id=$tagID&user_id=');

    if (response.statusCode==200) {
      response.data.forEach((element){
        blogsList.add(ArticleModel.fromJson(element));
      });

      bloglistloading.value==false;
    }
  }

  getHomeBlogListTags(String homeTagID) async{
    blogsList.clear();

    bloglistloading.value==true;
    
    var response = await DioService().getMethod('${APIconstance.baseURL}article/get.php?command=get_articles_with_tag_id&tag_id=$homeTagID&user_id=');

    if (response.statusCode==200) {
      response.data.forEach((element){
        blogsList.add(ArticleModel.fromJson(element));

        bloglistloading.value==false;
      });
    }
  }
}