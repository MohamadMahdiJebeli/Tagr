import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/blogs/manageBlogs_Controller.dart';

class BolgContentEditor extends StatelessWidget {
  BolgContentEditor({super.key});

  final HtmlEditorController controller = HtmlEditorController();
  var manageBlogContoller = Get.find<ManageBlogsController>();
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appbar(size, textTheme, "Edit/Write a Blog"),
        
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "Write Your Blog Here...",
                  shouldEnsureVisible: true,
                  initialText: manageBlogContoller.blogInfoModel.value.content
                ),
                callbacks: Callbacks(
                  onChangeContent:(p0) {
                     manageBlogContoller.blogInfoModel.value.content=p0;
                  },
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
