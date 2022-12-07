import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/service/notification_service.dart';
import '../../../utill/constant.dart';

class LoginProvider extends GetConnect {
  GetStorage _getStorage = GetStorage('app_storage');

  String token = NotificationService.userToken.value.toString();
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> verifyUserLogin(String email, String password) async {
    var userData = new Map();
    userData['email'] = email;
    userData['password'] = password;
    userData['device_token'] = token;

    // print("user data otp......" + userData.toString());
    print("user data otp......" +token.toString());
    //
    // var response =
    // await post(BASE_URL+"user-login", userData);


    // var response =
    // await post('http://172.31.120.238:80/api/user-login', userData);

    var response =
    await post(BASE_URL+'user-login', userData);

    print("status code //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("afterserver //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          await _getStorage.write('token', response.body['token']);
          await _getStorage.write('userID', response.body['user_id'].toString());

          return true;
        } else {
          Get.snackbar(
            "Error",
            "Provide correct email and password",
            colorText: Colors.white,
            backgroundColor: Colors.orangeAccent,
            snackPosition: SnackPosition.BOTTOM,

          );
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
