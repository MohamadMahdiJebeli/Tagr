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

    var response = await DioService().getMethod(APIconstance.getBlogsList);

    bloglistloading.value==true;

    if (response.statusCode==200) {
      response.data.forEach((element){
        blogsList.add(ArticleModel.fromJson(element));
      });
    }
    bloglistloading.value==false;
  }
}