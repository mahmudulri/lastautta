import 'package:get/get.dart';

import '../model/filter_post_model.dart';
import '../model/userall_post_model.dart';
import '../model/userglobal_post_model.dart';
import '../model/userjob_post_model.dart';
import '../providers/user_post_provider.dart';

class MypostController extends GetxController {
  //TODO: Implement MypostControllerController


  var postType =  'All Post'.obs;
  var isGlobalPostLoading = false.obs;
  var isJobPostLoading = false.obs;
  var isAllPostLoading = false.obs;
  var isAllFilterPostLoading = false.obs;
  var globalPost = UserGlobalPost().obs;
  var jobPost = UserJobPost().obs;
  var allPost = UserAllPost().obs;
  var allFilterPost = FilterPost().obs;
  var pickedDateRange = ''.obs;
  var startDate = "".obs;
  var endDate = "".obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserAllPost();
    fetchUserGlobalPost();
    fetchUserJobPost();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> fetchUserGlobalPost() async {
    isGlobalPostLoading.value = true;
    try{
      var globalPosts = await UserPostProvider().getUserGeneralPost();
      if ( globalPosts!= null ) {
        globalPost.value = globalPosts;
        isGlobalPostLoading.value = false;
      }

      else {
        isGlobalPostLoading.value = false;
      }

    }
    catch(e){
      print(e.toString());
    }
  }


  Future<void> fetchUserJobPost() async {
    isJobPostLoading.value = true;
    try{
      var jobPosts = await UserPostProvider().getUserJobPost();
      if ( jobPosts!= null ) {
        jobPost.value = jobPosts;
        isJobPostLoading.value = false;
      }

      else {
        isJobPostLoading.value = false;
      }

    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchUserAllPost() async {
    isAllPostLoading.value = true;
    try{
      var allPosts = await UserPostProvider().getUserAllPost();
      if ( allPosts!= null ) {
        allPost.value = allPosts;
        isAllPostLoading.value = false;
      }

      else {
        isAllPostLoading.value = false;
      }

    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchUserAllFilterPost() async {
    isAllFilterPostLoading.value = true;
    try{
      var allPosts = await UserPostProvider().getFilterUserAllPost(startDate.value.toString(), endDate.value.toString());
      if ( allPosts!= null ) {
        allFilterPost.value = allPosts;
        isAllFilterPostLoading.value = false;
      }

      else {
        isAllPostLoading.value = false;
      }

    }
    catch(e){
      print(e.toString());
    }
  }
}
