import 'package:get/get.dart';
import 'package:tagr/controller/blogs/blogListScreen_Controller.dart';
import 'package:tagr/controller/blogs/manageBlogs_Controller.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/controller/blogs/single_Blog_Controller.dart';

class BlogBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BlogListController());
    Get.lazyPut(() => SingleBlogController());
  }
}

class BlogManagerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ManageBlogsController());
  }

}

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }

}