import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../event/model/event_model.dart';
import '../model/advertisement_model.dart';
import '../model/banner_model.dart';
import '../model/blog_model.dart';
import '../model/job_model.dart';
import '../model/news_model.dart';
import '../model/post_model.dart';
import '../model/user_info_model.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  GetStorage _getStorage = GetStorage('app_storage');

  var isJobPostLoading = false.obs;
  var jobPost = Job().obs;

  var isAllPostLoading = false.obs;
  var allPost = AllPost().obs;

  var isBannerLoading = false.obs;
  var allBanner = BannerModel().obs;

  var isBlogLoading = false.obs;
  var allBlog = BlogModel().obs;

  var isNewsLoading = false.obs;
  var allNews = NewsModel().obs;

  var isEventPostLoading = false.obs;
  var event = EventModel().obs;

  var isUserInfoLoading = false.obs;
  var userInfo = UserInfoModel().obs;

  var isAddPostLoading = false.obs;


  var midAddVisibility = true.obs;

  var topAddVisibility = true.obs;

  var bottomAddVisibility = true.obs;

  var addLiveDate = "".obs;

  var currentMiddlePosition = 0.obs;

  var currentTopPosition = 0.obs;

  var currentBottomPosition = 0.obs;

  var currentBannerPosition = 0.obs;

  var midShowTime = '0'.obs;

  var middleAdvertisement = AllAdvertisement().obs;

  var topShowTime = '0'.obs;

  var topAdvertisement = AllAdvertisement().obs;

  var bottomShowTime = '0'.obs;

  var bottomAdvertisement = AllAdvertisement().obs;



  @override
  void onInit() {
    super.onInit();
     fetchAllPost();
     fetchEventPost();
     fetchAddPost();
     fetchBannerPost();
     fetchBlogPost();
     fetchNewsPost();
     fetchUserInfo();
    // showTime.value =  _getStorage.read('showTime').toString();


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> checkLogout() async {


    var LogoutStatus = await HomeProvider().doUserLogout();
    print("login status ......." + LogoutStatus.toString());

    if (LogoutStatus == true) {
      _changeLogoutStatus();
    } else {
      Get.snackbar(
        "Status",
        "Could not log out",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

  _changeLogoutStatus() async {
    GetStorage _getStorage = GetStorage('app_storage');
    await _getStorage.write('token', "");
    Get.offNamed(Routes.LOG_IN);
  }

  Future<void> fetchAllPost() async {
    isAllPostLoading.value = true;
    try{
      var allPosts = await HomeProvider().getPost();
      if ( allPosts!= null ) {
        allPost.value = allPosts;
        print("from controller"+allPosts.toString());

        print("from controller"+allPost.value.toString());
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

  Future<void> fetchEventPost() async {
    isEventPostLoading.value = true;
    try{
      var eventPosts = await HomeProvider().getEventPost();
      if ( eventPosts!= null ) {
        event.value = eventPosts;
        isEventPostLoading.value = false;
      }
      else {
        isEventPostLoading.value = false;
      }

    }
    catch(e){
      print(e.toString());
    }
  }


  Future<void> fetchAddPost() async {
    isAddPostLoading.value = true;
     try{


      await HomeProvider().getAdvertisementPost().then((value) {

        print("adddd................"+middleAdvertisement.toString());
        for(int i = 0 ; i< value!.allAdvertisements!.length ; i++){
          if(value.allAdvertisements![i].homePage.toString() == '1' && value.allAdvertisements![i].position.toString() == 'middle'){

            middleAdvertisement.value = value!.allAdvertisements![i];
            midShowTime.value = value!.allAdvertisements![i].showTime.toString();
            print("adddd22222................"+middleAdvertisement.value.position.toString());
          }

          else if(value.allAdvertisements![i].homePage.toString() == '1' && value.allAdvertisements![i].position.toString() == 'top'){

            topAdvertisement.value = value!.allAdvertisements![i];
            print('check1 ......'+value.allAdvertisements![i].position.toString());
            topShowTime.value = value!.allAdvertisements![i].showTime.toString();
            print("adddd333333333................"+topAdvertisement.value.position.toString());
          }

          else if (value.allAdvertisements![i].homePage.toString() == '1' && value.allAdvertisements![i].position.toString() == 'bottom'){
            print('check2 ......'+value.allAdvertisements![i].position.toString());
            bottomAdvertisement.value = value!.allAdvertisements![i];
            bottomShowTime.value = value!.allAdvertisements![i].showTime.toString();
            print("adddd444444................"+bottomAdvertisement.value.position.toString());
          }
          else {
            print('nottttttttttttttttttttttttttttt match');
          }
        }
        isAddPostLoading.value = false;
      }
      );

    }
    catch(e){
      print(e.toString());
    }
  }


  Future<void> fetchBannerPost() async {
    isBannerLoading.value = true;
    try {
      var banners = await HomeProvider().getBannerPost();
      if (banners != null) {
        allBanner.value = banners;
        isBannerLoading.value = false;
      }

      else {
        isBannerLoading.value = false;
      }
    }

    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchBlogPost() async {
    isBlogLoading.value = true;
    try {
      var blogs = await HomeProvider().getBlogPost();
      if (blogs != null) {
        allBlog.value = blogs;
        isBlogLoading.value = false;
      }

      else {
        isBlogLoading.value = false;
      }
    }

    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchNewsPost() async {
    isNewsLoading.value = true;
    try {
      var news = await HomeProvider().getNewsPost();
      if (news != null) {
        allNews.value = news;
        isNewsLoading.value = false;
      }

      else {
        isNewsLoading.value = false;
      }
    }

    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchUserInfo() async {
    isUserInfoLoading.value = true;
    try {
      var userInfos = await HomeProvider().getUserInfo();
      if (userInfos != null) {
        userInfo.value = userInfos;
        isUserInfoLoading.value = false;
      }

      else {
        isUserInfoLoading.value = false;
      }
    }

    catch(e){
      print(e.toString());
    }
  }

}
