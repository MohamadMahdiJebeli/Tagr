import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadImageController extends GetxController{
  Rx<PlatformFile> file = PlatformFile(name: "Nothing", size: 0).obs;
}