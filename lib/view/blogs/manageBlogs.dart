// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/registerController.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/component/string.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class ManageBlogs extends StatelessWidget {
  ManageBlogs({super.key});

  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appbar(size, textTheme,"Blog Management"),
      body: blogEmptyState(size, textTheme, context),
    );
  }

  Widget blogEmptyState(Size size, TextTheme textTheme, BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height/4,),
            Image(image: Assets.images.botSadSticker.provider(),height: 100,),
        
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: string.blogEmpty,
                  style: textTheme.headline2,
                )
              ),
            ),
            SizedBox(height: size.height/3,),
            ElevatedButton(onPressed: (){
              //Bttm Sheet
            },
            style: Theme.of(context).elevatedButtonTheme.style,
            child: const Text("Add Blog",),
            )
          ],
        ),
      ),
    );
  }
}
