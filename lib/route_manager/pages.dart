import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tagr/route_manager/binding.dart';
import 'package:tagr/main.dart';
import 'package:tagr/view/blogs/manageBlogs.dart';
import 'package:tagr/view/blogs/singleBlogScreen.dart';
import 'package:tagr/view/blogs/singleManageBlogScreen.dart';
import 'package:tagr/view/homeScreen/home.dart';
import 'package:tagr/view/podcasts/singlePodcastScreen.dart';

class Pages{

  Pages._();

  static List<GetPage<dynamic>> pages = [
        GetPage(name: NamedRoute.routeHome, page:() => Home(),binding: RegisterBinding()),
        GetPage(name: NamedRoute.routeSingleBlog, page:() =>SingleBlogScreen(),binding: BlogBinding()),
        GetPage(name: NamedRoute.routeManageBlog,page:() => ManageBlogs(),binding: BlogManagerBinding()),
        GetPage(name: NamedRoute.routeSingleManageBlogScreen, page: () => SingleManageBlogScreen(),binding: BlogManagerBinding()),
        GetPage(name: NamedRoute.routeSinglePodcast, page:()=> SinglePodcastScrren())
      ];
}