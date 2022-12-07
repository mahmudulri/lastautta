import 'dart:convert';

import 'package:aust_textile_alumni/app/utill/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../event/model/event_model.dart';
import '../model/advertisement_model.dart';
import '../model/banner_model.dart';
import '../model/blog_model.dart';
import '../model/job_model.dart';
import '../model/news_model.dart';
import '../model/post_model.dart';
import 'package:http/http.dart 'as http;

import '../model/user_info_model.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  GetStorage _getStorage = GetStorage('app_storage');


  Future<dynamic> doUserLogout() async {

    final String? logInToken = _getStorage.read('token');


    var response = await get(
        BASE_URL+'user-logout',
        headers: {'Authorization': 'Bearer $logInToken'},
    );

    if (response.statusCode == 200) {
      // print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          // print("bodystatus //////////" + response.body['status'].toString());

          return true;
        }
      } catch (e) {
         print(e.toString());
      }
    } else {
      return false;
    }


  }

  Future<AllPost?> getPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response = await get(
    //     'http://172.31.120.238:80/api/all-posts',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );

    var response = await get(
        BASE_URL+'all-posts',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
         print("allpostttttt //////////" + response.body.toString());

          // var finalResponse = jsonDecode(response.body.toString());

        //  print("allpostttttt //////////" +finalResponse['status'].toString());

        // print("postStatus ////////" + finalResponse['status'].toString());

      try {
        if (response.body['status'] == 200) {

          // print("postStatus ////////" + finalResponse['status'].toString());

            var jsonString = response.body;
             print("response_all_post,,,,,,,,,,,,,,,,,,,,,"+jsonString.toString());
             return AllPost.fromJson(jsonString);
            // return AllPost.fromJson(finalResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<EventModel?> getEventPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    var response = await get(
        BASE_URL+'all-event-posts',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
       // print("event_post //////////" + response.body.toString());


      try {
        if (response.body['status'] == 200) {
            // print("event_post1 //////////" + response.body.toString());

             var jsonString = response.body;
            // print("response_event_post,,,,,,,,,,,,,,,,,,,,,"+jsonString.toString());
          return EventModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<Advertisement?> getAdvertisementPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    final url = Uri.parse(BASE_URL+'all-advertisements');


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      // print("errorafterhit //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          // print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          // print("add ....response,,,,,,,,,,,,,,,,,,,,,"+jsonResponse.toString());
          return Advertisement.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<BannerModel?> getBannerPost() async {

    final String? logInToken = _getStorage.read('token');



    final url = Uri.parse(BASE_URL+'latest-event-mobile-banner');


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
       print("bannnnnnnnner //////////" + response.body.toString());

       var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("bodystatus //////////" + jsonResponse['status'].toString());


          // var jsonString = response.body;
          print("responsebbbbbbbbbbb,,,,,,,,,,,,,,,,,,,,,"+jsonResponse.toString());
          return BannerModel.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<BlogModel?> getBlogPost() async {

    final String? logInToken = _getStorage.read('token');



    final url = Uri.parse(BASE_URL+'all-article-blogs');


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("bannnnnnnnner //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("bodystatus //////////" + jsonResponse['status'].toString());


          // var jsonString = response.body;
          print("responsebbbbbbbbbbb,,,,,,,,,,,,,,,,,,,,,"+jsonResponse.toString());
          return BlogModel.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<NewsModel?> getNewsPost() async {

    final String? logInToken = _getStorage.read('token');



    final url = Uri.parse(BASE_URL+'all-notice-news');


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("bannnnnnnnner //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("bodystatus //////////" + jsonResponse['status'].toString());


          // var jsonString = response.body;
          print("responsebbbbbbbbbbb,,,,,,,,,,,,,,,,,,,,,"+jsonResponse.toString());
          return NewsModel.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<UserInfoModel?> getUserInfo() async {

    final String? logInToken = _getStorage.read('token');

    final String? id = _getStorage.read('userID').toString();



    final url = Uri.parse(BASE_URL+'specific-user/'+id.toString());


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("bannnnnnnnner //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("bodystatus //////////" + jsonResponse['status'].toString());


          // var jsonString = response.body;
          print("responsebbbbbbbbbbb,,,,,,,,,,,,,,,,,,,,,"+jsonResponse.toString());
          return UserInfoModel.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }




}
