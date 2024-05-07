import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogListScreen_Controller.dart';

class BlogsListScreen extends StatelessWidget {
  BlogsListScreen({super.key});

  BlogListController blogListController = Get.put(BlogListController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;

    return Scaffold(
      //Appbar
      appBar: Appbar(size, textTheme,"Blogs"),
      //Body
      body: Obx(()=>
        SizedBox(
          child: ListView.builder(
            
            itemCount: blogListController.blogsList.length,
            itemBuilder: (context, index) {
              return Text(blogListController.blogsList[index].title!);
            },
            ),
        ),
      ),
    );
  }
}