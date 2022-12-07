import 'dart:convert';

import 'package:aust_textile_alumni/app/modules/home/model/job_model.dart';
import 'package:aust_textile_alumni/app/utill/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart 'as http;

import '../../user_post/model/userjob_post_model.dart';
import '../model/all_job_post.dart';

class JobProvider extends GetConnect {

  GetStorage _getStorage = GetStorage('app_storage');

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Job?> getUserJobPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response = await get(
    //     BASE_URL+'all-job-post',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );

    final url = Uri.parse(BASE_URL+'all-job-post');

    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("job_post //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("job_status_code //////////" + jsonResponse['status'].toString());

          print("job_status_code 1111 //////////" + jsonResponse.toString());

           return Job.fromJson(jsonResponse);
          // return jobFromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }
}
