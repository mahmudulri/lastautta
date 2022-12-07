import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:aust_textile_alumni/app/modules/base/views/base_view.dart';
import 'package:aust_textile_alumni/app/modules/user_post/db_helper/database_helper.dart';
import 'package:aust_textile_alumni/app/modules/user_post/model/jobpost_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/model/post_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/providers/user_post_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/controllers/home_controller.dart';
import '../../job/controllers/job_controller.dart';
import '../model/chip_model.dart';
import '../model/job_dept_model.dart';
import '../model/jobpost_type_model.dart';
import '../model/post_type_model.dart';


class UserPostController extends GetxController {
  //TODO: Implement UserPostController

  final count = 0.obs;

  GetStorage _getStorage = GetStorage('app_storage');


  HomeController controller = Get.put(HomeController());

  JobController jobController = Get.put(JobController());


  var selectedImagePath = ''.obs;

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
  var date = DateTime.now().toString().substring(0,16);
  var isPublished = '0';
  var tag = ''.obs;

  var jobTitle = "".obs;
  var companyName = "".obs;
  var jobDept = "".obs;
  var jobType = "".obs;
  var jobLocation = "".obs;
  var jobDescription = "".obs;
  var isArchived = '1';
  var jobStatus = '1';
  var application_deadline = 'Select application deadline'.obs;
  var jobLink = ''.obs;
  var dropDownJobPostItem = <String>[].obs;
  var dropDownJobPostDept = <String>[].obs;
  var dropDownJobLocationItem = <String>["On Site","Remote"];

  var isLoading = false.obs;
  var isProcessing = false.obs;
  var postTypeList = <PostTypeElement>[].obs;

  var jobPostType = <JobType>[].obs;
  var jobPostDept = <Department>[].obs;


  List chipList = <ChipModel>[].obs as List<ChipModel>;

  var draftPost = <PostModel>[].obs;

  List<JobPostModel> draftJobPost = <JobPostModel>[].obs;



  TextEditingController chipTextController = TextEditingController();

  var showImageName = ''.obs;
  var showJobImageName = ''.obs;


  @override
  void onInit() {
    super.onInit();
    postedBy.value =  _getStorage.read('userID').toString();
    print("user........id"+postedBy.value.toString());

    fetchPostType();
    fetchJobPostType();
    fetchDraftPost();
    fetchDraftJobPost();
    fetchJobPostDept();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    DatabaseHelper.instance.close();
  }
  void increment() => count.value++;


  chooseApplicationDeadLine() async{

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2130),
        builder: (context,widget) => Theme(
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
    application_deadline.value = pickedDate.toString().substring(0,11);

  }


  Future<void> getImage(String postType) async {

    if(postType == "global") {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 5);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        imageFile = File(pickedFile.path);
        base64Image.value = base64Encode(imageFile!.readAsBytesSync());
      } else {
        print("No image selected");
      }
    }
    else {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedJobImagePath.value = pickedFile.path;
        jobImageFile = File(pickedFile.path);
        base64JobImage.value = base64Encode(imageFile!.readAsBytesSync());
      } else {
        print("No image selected");
      }
    }


  }

  Future<void> getFile() async {

    final pickedFile = await FilePicker.platform.pickFiles();

    if(pickedFile != null){
      documentFile = File(pickedFile.files.single.path.toString());
      fileName.value = pickedFile.files.single.name.toString();

    }
  }

  Future<void> uploadUserPost() async {

    isLoading.value = true;

    for(int i = 0 ; i<chipList.length ; i++){
      tag.value = tag+ " " + chipList[i].title.toString();
      print(tag.value.toString());
    }

    var status = await UserPostProvider()
        .uploadPost(postTitle.toString(), postType.toString(), postDescription.toString(), postedBy.toString(), date.toString(), isPublished.toString(), imageFile as File,selectedImagePath.toString(),tag.value);
    print("login status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Post Uploaded for Admin Approval",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
      controller.fetchAllPost();
      Get.to(
          () => BaseView()
      );
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not upload the post",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }


  Future<void> fetchPostType() async {
    try{

      await  UserPostProvider().getPostType().then((value) => {
            postTypeList.value = value!.postType
      });
       }
    catch(e){
      print(e.toString());
    }
  }


  Future<void> fetchJobPostType() async {
    try{

      await UserPostProvider().getJobPostDept().then((value) => {
        jobPostDept.value = value!.department

      });
     }


    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchJobPostDept() async {
    try{
      await UserPostProvider().getJobPostType().then((value) {
        jobPostType.value = value!.jobType;
      });
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> uploadUserJobPost() async {

    isProcessing.value = true;

    for(int i = 0 ; i<chipList.length ; i++){
      tag.value = tag+ " " + chipList[i].title.toString();
      print(tag.value.toString());
    }

    var status = await UserPostProvider()
        .uploadJobPost(jobTitle.toString(), jobType.toString(), jobDescription.toString(),
            postedBy.toString(), date.toString(), isPublished.toString(),
              jobImageFile as File,selectedJobImagePath.toString(), jobLink.value,isArchived.toString(),
              application_deadline.value,jobDept.value.toString(),jobLocation.value.toString(),companyName.value.toString()
    );
    print("login status ......." + status.toString());

    if (status == true) {
      isProcessing.value = false;
      Get.snackbar(
        "Status",
        "Post Uploaded",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
      jobController.fetchUserJobPost();
      Get.to(
              () => BaseView()
      );
    } else {
      isProcessing.value = false;
      Get.snackbar(
        "Status",
        "Could not upload the post",
        colorText: Colors.white,
        backgroundColor:Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

  Future draftUserPost() async {

    PostModel postModel = PostModel(
         postTitle: postTitle.value,
         postType: postType.value,
         postDescription: postDescription.value,
         image: base64Image.value,
         postedBy: postedBy.value,
         date: date,
         isPublished: isPublished,
         tag: tag.value
    );

    int i =  await DatabaseHelper.instance.insertPost(postModel);
    if( i != 0 && i != null){
      Get.snackbar(
        "Status",
        "Your post has been saved",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
    else {
      Get.snackbar(
        "Status",
        "Your post has not been saved",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }

  }

  Future<void> fetchDraftPost() async {
   draftPost.value =  await DatabaseHelper.instance.getPostList();

  }

  Future updateDraftPost(PostModel postModel) async {
   int  i = await DatabaseHelper.instance.updatePost(postModel);
   if( i != 0){
     fetchDraftPost();
     draftPost.refresh();
   }
   print("post list "+i.toString());
  }

  Future deleteDraftPost(int j) async {
    int  i = await DatabaseHelper.instance.deletePost(j);
    if( i != 0){
      fetchDraftPost();
      draftPost.refresh();
    }
    print("post list "+i.toString());
  }

  Future draftUserJobPost() async {

    JobPostModel jobPostModel = JobPostModel(
       companyName: companyName.value.toString(),
       jobType: jobType.value.toString(),
       jobTitle: jobTitle.value.toString(),
       jobDescription: jobDescription.value.toString(),
       jobLink: jobLink.value.toString(),
       jobImage:  base64JobImage.value.toString(),
       jobPostedBy: postedBy.value.toString(),
       jobLocation: jobLocation.value.toString(),
       isJobPublished : isPublished,
       isJobIsArchived: isArchived,
       applicationDeadline: application_deadline.value.toString(),
       departmentName: jobDept.value.toString(),
    );

    int i =  await DatabaseHelper.instance.insertJobPost(jobPostModel);

    print("post list "+i.toString());

    if( i != 0 && i != null){
      Get.snackbar(
        "Status",
        "Your post has been saved",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
    else {
      Get.snackbar(
        "Status",
        "Your post has not been saved",
        colorText: Colors.white,
        backgroundColor:Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }

  }

  Future<void> fetchDraftJobPost() async {
    draftJobPost =  await DatabaseHelper.instance.getJobPostList();

  }


  Future updateDraftJobPost(JobPostModel jobPostModel) async {
    int  i = await DatabaseHelper.instance.updateJobPost(jobPostModel);
    if( i != 0){
      fetchDraftPost();
    }
    print("post list "+i.toString());
  }

  Future deleteDraftJobPost(int j) async {
    int  i = await DatabaseHelper.instance.deleteJobPost(j);
    print("post list "+i.toString());
  }

  void postImageName(){
    final random = Random();
    int max = 5;
    int min = 1;
    for (var i = 0; i < 7; i++) {
      showImageName.value = showImageName + random.nextInt(max - min).toString();
    }

    showImageName.value = showImageName+'.jpg';
  }

  void jobImageName(){
    final random = Random();
    int max = 5;
    int min = 1;


    for (var i = 0; i < 7; i++) {
      showJobImageName.value = showJobImageName + random.nextInt(max - min).toString();
    }

    showJobImageName.value = showJobImageName+'.jpg';
  }


}
