import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../model/chip_model.dart';
import '../model/job_dept_model.dart';
import '../model/jobpost_type_model.dart';
import '../model/post_type_model.dart';
import '../model/userall_post_model.dart';
import '../providers/user_post_provider.dart';

class UpdatePostController extends GetxController {
  //TODO: Implement UpdatePostController

  final count = 0.obs;

  var isAllPostLoading = false.obs;
  var allPost = UserAllPost().obs;

  GetStorage _getStorage = GetStorage('app_storage');


  var selectedImagePath = ''.obs;

  late int postId;

  late int  jobId;

  File? imageFile;

  var base64Image = "".obs;

  var selectedJobImagePath = ''.obs;

  File? jobImageFile;

  var base64JobImage = "".obs;

  File? documentFile;

  var fileName = ''.obs;

  var postTitle = ''.obs;
  var postType = ''.obs;
  var postDescription = ''.obs;
  var postedBy = ''.obs;
  var date = DateTime.now().toString().substring(0, 16);
  var isPublished = '1';
  var tag = ''.obs;
  var dropDownPostItem = <String>[].obs;

  var jobTitle = "".obs;
  var companyName = "".obs;
  var jobDept = "".obs;
  var jobType = "".obs;
  var jobLocation = "".obs;
  var jobDescription = "".obs;
  var isArchived = '1';
  var jobStatus = '1';
  var application_deadline = 'Select application deadline'.obs;
  var jobLink = 'joblink.com'.obs;
  var dropDownJobPostItem = <String>[].obs;
  var dropDownJobPostDept = <String>[].obs;
  var dropDownJobLocationItem = <String>["On Site", "Remote"];

  var isLoading = false.obs;
  var isProcessing = false.obs;
  var postTypeList = <PostTypeElement>[].obs;

  var jobPostType = <JobType>[].obs;
  var jobPostDept = <Department>[].obs;

  var showImageName = ''.obs;
  var showJobImageName = ''.obs;

  List chipList = <ChipModel>[].obs as List<ChipModel>;

  TextEditingController chipTextController = TextEditingController();

  var json = "".obs;


  @override
  void onInit() {
    super.onInit();
    fetchUserAllPost();
    fetchJobPostType();
    fetchPostType();
    fetchJobPostDept();
    postedBy.value = _getStorage.read('userID').toString();

    final random = Random();
    int max = 5;
    int min = 1;
    for (var i = 0; i < 7; i++) {
      showImageName.value =
          showImageName + random.nextInt(max - min).toString();
    }

    for (var i = 0; i < 7; i++) {
      showJobImageName.value =
          showImageName + random.nextInt(max - min).toString();
    }

    showImageName.value = showImageName + '.jpg';
    showJobImageName.value = showJobImageName + '.jpg';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;


  Future<void> fetchUserAllPost() async {
    isAllPostLoading.value = true;
    try {
      var allPosts = await UserPostProvider().getUserAllPost();
      if (allPosts != null) {
        allPost.value = allPosts;
        print("......................." + allPost.value.toString());
        isAllPostLoading.value = false;
      }

      else {
        isAllPostLoading.value = false;
      }
    }
    catch (e) {
      print(e.toString());
    }
  }

  chooseApplicationDeadLine() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2130),
        builder: (context, widget) =>
            Theme(
              data: ThemeData().copyWith(
                colorScheme: ColorScheme.dark(
                    surface: Colors.blueAccent
                ),
                dialogBackgroundColor: Colors.blueAccent.shade200,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    onSurface: Colors.white, // button text color
                  ),
                ),
              ),
              child: widget!,
            )
    );
    application_deadline.value = pickedDate.toString().substring(0, 11);
  }


  Future<void> getImage(String postType) async {
    if (postType == "global") {
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, imageQuality: 5);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        imageFile = File(pickedFile.path);
        base64Image.value = base64Encode(imageFile!.readAsBytesSync());
      } else {
        print("No image selected");
      }
    }
    else {
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedJobImagePath.value = pickedFile.path;
        jobImageFile = File(pickedFile.path);
        base64JobImage.value = base64Encode(imageFile!.readAsBytesSync());
      } else {
        print("No image selected");
      }
    }
  }

  Future<void> fetchPostType() async {
     try {

       await  UserPostProvider().getPostType().then((value) => {
         postTypeList.value = value!.postType
       });

    }
    catch (e) {
      print(e.toString());
    }
  }


  Future<void> fetchJobPostType() async {
    try {

      await UserPostProvider().getJobPostDept().then((value) => {
        jobPostDept.value = value!.department

      });
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchJobPostDept() async {
    try {
      await UserPostProvider().getJobPostType().then((value) {
        jobPostType.value = value!.jobType;
      });

    }
    catch (e) {
      print(e.toString());
    }

  }

  void updateField(int index) {
    postDescription.value =
        allPost.value.userAllPosts![0].userPost![index].postDescription
            .toString();
    // postId = allPost.value.userAllPosts![0].userPost![index].id!;
    postTitle.value =
        allPost.value.userAllPosts![0].userPost![index].postTitle.toString();
    tag.value =
        allPost.value.userAllPosts![0].userPost![index].tag.toString();
  }

  void updateJobField(int index) {
    jobDescription.value = allPost.value.userAllPosts![0].jobPost![index].jobDescription.toString();

    // jobId = allPost.value.userAllPosts![0].jobPost![index].id!;

    jobTitle.value = allPost.value.userAllPosts![0].jobPost![index].jobTitle.toString();

    jobDept.value = allPost.value.userAllPosts![0].jobPost![index].departmentId.toString();

    jobType.value = allPost.value.userAllPosts![0].jobPost![index].jobType.toString();

    jobLocation.value = allPost.value.userAllPosts![0].jobPost![index].jobLocation.toString();

    application_deadline.value = allPost.value.userAllPosts![0].jobPost![index].applicationDeadline.toString();
  }
}
