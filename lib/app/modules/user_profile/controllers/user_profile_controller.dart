import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'dart:io';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  File? documentFile;

  var fileName = ''.obs;


  var bioInfoText = ''.obs;
  var phoneNo = ''.obs;
  var personalEmail = ''.obs;
  var officialEmail = ''.obs;
  var facebook = ''.obs;
  var linkedin = ''.obs;
  var twitter = ''.obs;
  var professionalInfoText= ''.obs;

  var company = ''.obs;
  var address = ''.obs;
  var designation = ''.obs;
  var year = ''.obs;


  var count = 1.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> getFile() async {

    final pickedFile = await FilePicker.platform.pickFiles();

    if(pickedFile != null){
      documentFile = File(pickedFile.files.single.path.toString());
      fileName.value = pickedFile.files.single.name.toString();

    }
  }
}
