import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import '../../../utill/constant.dart';
import '../model/filter_post_model.dart';
import '../model/job_dept_model.dart';
import '../model/jobpost_type_model.dart';
import '../model/post_type_model.dart';
import '../model/userall_post_model.dart';
import '../model/userglobal_post_model.dart';
import '../model/userjob_post_model.dart';
import 'package:http/http.dart 'as http;

class UserPostProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  GetStorage _getStorage = GetStorage('app_storage');


  Future<dynamic> uploadPost(String title, String type, String description,String post_by,
      String date, String isPublish, File? image_file,String path,String tag) async {

    final String? logInToken = _getStorage.read('token');

    print("posted.............by"+post_by.toString());


    FormData _formData = FormData({
      'post_title' : title,
      'post_type' : type,
      'post_description' :  description,
      'posted_by' : post_by,
      'date' : date,
      'isPublished' :  isPublish,
      'image' : MultipartFile(image_file, filename: DateTime.now().toString()+path),
       'tag': tag


    });



     // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';
    //
    // var response =
    // await post(BASE_URL+"save-post", _formData,
    //     headers: {
    //   'Authorization': 'Bearer $logInToken'});

    // var response =
    // await post("http://172.31.120.238:80/api/save-post", _formData,
    //     headers: {
    //       'Authorization': 'Bearer $logInToken'});

    var response =
    await post(BASE_URL+"save-post", _formData,
        headers: {
          'Authorization': 'Bearer $logInToken'});

    // print("errorprovider //////////" + _formData.toString());

    // print("errorproviderstatus code //////////" + response.statusCode.toString());

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

      //  return response.body;
    } else {
      return false;
    }
  }

  Future<PostType?> getPostType() async {

     final String? logInToken = _getStorage.read('token');

     // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response = await get(
    //    'http://172.31.120.238:80/api/post-type',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );


     var response = await get(
         BASE_URL+'post-type',
         headers: {'Authorization': 'Bearer $logInToken'}
     );

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          return PostType.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }


  }

  Future<JobPostType?> getJobPostType() async {

     final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    var response = await get(
        BASE_URL+'job-type',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          print("jobtype"+jsonString.toString());
          return JobPostType.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<JobDepartment?> getJobPostDept() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response = await get(
    //     'http://172.31.120.238:80/api/department',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );

    var response = await get(
        BASE_URL+'department',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          return JobDepartment.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<dynamic> uploadJobPost(String title, String type, String description,String post_by,
      String date, String isPublish, File image_file,String path,String jobLink, String isArchived,
        String application_deadline,String dept_id,String jobLocation,String companyName) async {

     final String? logInToken = _getStorage.read('token');

     print("posted.............by"+post_by.toString());


    FormData _formData = FormData({
      'job_title' : title,
      'job_type' : type,
      'job_description' :  description,
      'job_link' : jobLink,
      'posted_by' : post_by,
      'date' :  date,
      'isPublished' : isPublish,
      'isArchived' : isArchived,
      'application_deadline' :  application_deadline,
      'image' : MultipartFile(image_file, filename: DateTime.now().toString()+path),
      'department_id':dept_id,
      'job_location':jobLocation,
      'company_name': companyName



    });



    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response =
    // await post(BASE_URL+"save-job-post", _formData,
    //     headers: {
    //       'Authorization': 'Bearer $logInToken'});

     var response =
     await post(BASE_URL+"save-job-post", _formData,
         headers: {
           'Authorization': 'Bearer $logInToken'});


    print("errorprovider //////////" + _formData.toString());

    // print("errorproviderstatus code //////////" + response.statusCode.toString());

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

      //  return response.body;
    } else {
      return false;
    }
  }

  Future<UserGlobalPost?> getUserGeneralPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response = await get(
    //    'http://172.31.120.238:80/api/user-posts-filtering/general_post',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );

    var response = await get(
        BASE_URL+'user-posts-filtering/general_post',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          return UserGlobalPost.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }


  }

  Future<UserJobPost?> getUserJobPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    var response = await get(
        BASE_URL+'user-posts-filtering/job_post',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          return UserJobPost.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<UserAllPost?> getUserAllPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    final url = Uri.parse(BASE_URL+'user-posts-filtering/all');


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );


    // var response = await get(
    //     BASE_URL+'user-posts-filtering/all',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );

    if (response.statusCode == 200) {
      print("all post status  body//////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);


      try {
        if (jsonResponse['status'] == 200) {
            // print("all post status //////////" + jsonResponse['status'].toString());

            print("all post status //////////" + jsonResponse.toString());

          // var jsonString = response.body;
          return UserAllPost.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<FilterPost?> getFilterUserAllPost(String startDate, String lastDate) async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    Map<String, String> userData = Map();
    userData['fromDate'] = startDate;
    userData['toDate'] = lastDate;

    // var response = await post(
    //     'http://172.31.120.238:80/api/post-filtering-by-two-dates',userData,
    //     headers: {'Authorization': 'Bearer $logInToken'},
    // );

    var response = await post(
      BASE_URL+'post-filtering-by-two-dates',userData,
      headers: {'Authorization': 'Bearer $logInToken'},
    );

    print("errorafterhit //////////" + userData.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          return FilterPost.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }
}
