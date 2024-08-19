  // ignore_for_file: file_names, deprecated_member_use

  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:get/get_core/src/get_main.dart';
  import 'package:get_storage/get_storage.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:tagr/component/component.dart';
  import 'package:tagr/constant/stroge_constant.dart';
  import 'package:tagr/gen/assets.gen.dart';
  import 'package:tagr/constant/colors.dart';
  import 'package:tagr/constant/string.dart';
  import 'package:tagr/main.dart';
import 'package:tagr/view/podcasts/managePodcast.dart';
  import 'package:tagr/view/register/registerIntro.dart';
  import 'package:tagr/view/register/userInfo.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


  class ProfileScreen extends StatefulWidget {
     ProfileScreen({
      super.key,
      required this.size,
      required this.textTheme,
      required this.spaceWidth,
    });

    final Size size;
    final TextTheme textTheme;
    final double spaceWidth;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadEmail();
  }

void _loadUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedUserName = prefs.getString('userName');
  
  if (storedUserName != null) {
    setState(() {
      userNameAc = storedUserName;
    });
    print("Loaded userName: $storedUserName");
  } else {
    print("No userName found in storage");
  }
}

void _loadEmail() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedEmail = prefs.getString('email');

  if (storedEmail !=null) {
    setState(() {
      emailAc = storedEmail;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //User Image
        Image(image: Assets.images.user.provider(), height: widget.size.height / 7,),
        //const SizedBox(height: 12),
        //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
            //ImageIcon(Assets.icons.editPicture.provider(), color: SoidColor.colorSubject,),
            //const SizedBox(width: 8,),
            //Text(string.editPicture, style: widget.textTheme.headline2,)
          //],
        //),
        SizedBox(height: widget.size.height /50,),
        //Profile Information
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userNameAc, style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black)),
          ),
        ),
        //Text(emailAc, style: widget.textTheme.bodyText2,),
        SizedBox(height: widget.size.height / 7,),
        //Profile Menu
        ProfileDivider(size: widget.size),
        InkWell(
          onTap: () {
            Get.toNamed(NamedRoute.routeManageBlog);
          },
          splashColor: SoidColor.colorSubject,
          child: SizedBox(
            height: widget.size.height / 20,
            child: ZoomTapAnimation(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(Assets.icons.favBlog.provider(),),
                  const SizedBox(width: 5,),
                  Text(string.favoriteBlogs, style: widget.textTheme.headline5,)
                ],
              ),
            ),
          ),
        ),
        ProfileDivider(size: widget.size),
        InkWell(
          onTap: () {
            Get.to(ManagePodcast());
          },
          splashColor: SoidColor.colorSubject,
          child: SizedBox(
            height: widget.size.height / 20,
            child: ZoomTapAnimation(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(Assets.icons.favPodcast.provider(),),
                  const SizedBox(width: 5,),
                  Text(string.favoritePodcast, style: widget.textTheme.headline5,)
                ],
              ),
            ),
          ),
        ),
        ProfileDivider(size: widget.size),
        InkWell(
          onTap: () {
            GetStorage().read(StorageKey.token) == null;
            Get.offAll(const RegisterIntro());
          },
          splashColor: SoidColor.colorSubject,
          child: SizedBox(
            height: widget.size.height / 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.logout.provider(),),
                const SizedBox(width: 5,),
                Text(string.logOut, style: widget.textTheme.headline5,)
              ],
            ),
          ),
        ),
        SizedBox(height: widget.size.height / 7,)
      ],
    );
  }
}
