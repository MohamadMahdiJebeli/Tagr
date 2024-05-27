import 'package:get/get.dart';
import 'package:tagr/component/api_constant.dart';
import 'package:tagr/models/articleModel.dart';
import 'package:tagr/models/blogInfoModel.dart';
import 'package:tagr/models/tagsModel.dart';
import 'package:tagr/services/dioService.dart';
import 'package:tagr/view/homeScreen/singleBlogScreen.dart';

class SingleBlogController extends GetxController{
  RxBool singleBlogLoading = false.obs;
  RxInt id = RxInt(0);
  Rx<BlogInfoModel> blogInfoModel = BlogInfoModel().obs;
  RxList<TagsModel> relatedTags = RxList();
  RxList<ArticleModel> relatedBlogs = RxList();

  @override
  // ignore: unnecessary_overrides
  onInit(){
    super.onInit();
  }

  getBlogInfo(var id) async{ 
  
  blogInfoModel = BlogInfoModel().obs;

  singleBlogLoading.value=true;

  var userId='';

  var response =  await DioService().getMethod("${APIconstance.baseURL}article/get.php?command=info&id=$id&user_id=$userId");

  if (response.statusCode==200) {
    
    blogInfoModel.value = BlogInfoModel.fromJson(response.data);

    singleBlogLoading.value=false;


    relatedTags.clear();

    response.data['tags'].forEach((element){
      relatedTags.add(TagsModel.fromJson(element));


    relatedBlogs.clear();

    response.data['related'].forEach((element){
      relatedBlogs.add(ArticleModel.fromJson(element));
    });
    });
  } 

  Get.to(SingleBlogScreen());

}
}