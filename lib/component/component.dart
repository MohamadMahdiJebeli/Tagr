import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tagr/controller/homeScreen_Controller.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'colors.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: size.width/6,
      endIndent: size.width/6,
      color: SoidColor.colorDivider,
    );
  }
}

// ignore: must_be_immutable
class MainTags extends StatelessWidget {
   MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  // ignore: prefer_typing_uninitialized_variables
  var index;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Container(
        height: 20,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
      
          gradient: LinearGradient(colors: GradientColor.tagsColor,begin: Alignment.centerRight,end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(Assets.icons.hashtags.provider(),color: Colors.white,size: 14,),
              const SizedBox(width: 6,),
              // ignore: deprecated_member_use
              Text(Get.find<HomeScreen_Controller>().tagList[index].title!,style: textTheme.bodyText1,),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class loading extends StatelessWidget {
  const loading({super.key});
  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
            color: SoidColor.colorLoading,
            size: 30,
            );
}}

// ignore: non_constant_identifier_names
AppBar appbar(Size size, TextTheme textTheme, String title) {
    return AppBar(
      actions: [
        Center(child: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          // ignore: deprecated_member_use
          child: Text(title,style: textTheme.headline5,))),
      ],
      leading: Padding(
        padding: const EdgeInsets.all(17.0),
        child: GestureDetector(
          onTap: Get.back,
          child: ImageIcon(Assets.icons.back.provider(),size: 20,)),
      ),
    );
  }