

import 'dart:convert';

import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../otp/views/otp_view.dart';
import 'dart:io';
import '../model/company_model.dart';
import '../model/job_sector_model.dart';
import '../model/job_sub_sector_model.dart';
import '../providers/register_provider.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  var fullName = ''.obs;
  var name = ''.obs;
  var batch = ''.obs;
  var mobileNo = ''.obs;
  var bloodGroup = ''.obs;
  var stream = ''.obs;

  var jobSector = ''.obs;
  var jobSectorId = '0'.obs;
  var jobSubSector = ''.obs;
  var email = ''.obs;
  var officialEmail = ''.obs;
  var officeAddress = ''.obs;
  var companyName = ''.obs;
  var presentAddress = ''.obs;
  var permanentAddress = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  var isLoading = false.obs;

  var selectedImagePath = ''.obs;

  File? imageFile;

  var dropdownbloodgroup = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ].obs;

  var dropdownBatch = <String>[
    '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th',
    '9th',
    '10th',
    '11th',
    '12th',
    '13th',
    '14th',
    '15th',
    '16th',
    '17th',
    '18th',
    '19th',
    '20th',
    '21st',
    '22nd',
    '23rd',
    '24th',
    '25th',
    '26th',
    '27th',
    '28th',
    '29th',
    '30th',
    '31st',
    '32nd',
    '33rd',
    '34th',
    '35th',
    '36th',
    '37th',
    '38th',
    '39th',
    '40th',
    '41st',
    '42nd',
    '43rd',
    '44th',
    '45th',
    '46th',
    '47th',
    '48th',
    '49th',
    '50th',
  ];

  var dropdownStream = <String>[
    'Stream 1',
    'Stream 2',
    'Stream 3',
    'Stream 4',
  ].obs;

  var buttonEnableNumber = 0.obs;

  int date = int.parse(DateTime
      .now()
      .year
      .toString());

  var isVisible = false.obs;

  var isVisible2 = false.obs;

  var jobSectorList = <JobSectorElement>[].obs;

  var jobSubSectorList = <JobSubSectorElement>[].obs;

  var companyNameList = <CompanyName>[].obs;



  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobSector();
    fetchCompanyName();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  Future<void> getImage(double screenHeight) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      imageFile = File(pickedFile.path);
    } else {
      print("No image selected");
    }
  }

  Future<void> checkRegistration() async {
    isLoading.value = true;

    var status = await RegisterProvider()
        .doRegistration(
        fullName.value.toString(),
        name.value.toString(),
        email.value.toString(),
        batch.value.toString(),
        mobileNo.value.toString(),
        bloodGroup.value.toString(),
        stream.value.toString(),
        jobSector.value.toString(),
        jobSubSector.value.toString(),
        officialEmail.value.toString(),
        officeAddress.value.toString(),
        companyName.value.toString(),
        presentAddress.value.toString(),
        permanentAddress.value.toString(),
        password.value.toString(),
        confirmPassword.value.toString(),
        imageFile as File,
        selectedImagePath.value.toString()
    );
    print("Registration status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      // Get.offAndToNamed(Routes.HOME);
      Get.toNamed(Routes.OTP);
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not Register",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

  Future<void> fetchJobSector() async {
    try {
      await RegisterProvider().getJobSector().then((value) =>
      {
        jobSectorList.value = value!.jobSector
      });
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchJobSubSector() async {
    try {
      await RegisterProvider().getJobSubSector(jobSectorId.toString()).then((value) =>
      {
        jobSubSectorList.value = value!.jobSubSectors
      });
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchCompanyName() async {
    try {
      await RegisterProvider().getCompanyName().then((value) =>
      {
        companyNameList.value = value!.companyName
      });

      var data = await rootBundle.loadString('assets/files/company.json');
      var jsonFromFile = json.decode(data);
      CompanyName companyName = CompanyName.fromJson(jsonFromFile);
      companyNameList.add(companyName);

    }


    catch (e) {
      print(e.toString());
    }
  }
}
