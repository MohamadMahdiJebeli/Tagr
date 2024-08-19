import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tagr/controller/uploadImageController.dart';

UploadImageController uploadImageController = Get.put(UploadImageController());

Future pickFile() async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  uploadImageController.file.value = result!.files.first;
}
Future audioFile()async{
  
  UploadImageController filePickerController = Get.put(UploadImageController());
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio );
  filePickerController.file.value = result!.files.first;
}