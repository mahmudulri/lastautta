import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utill/constant.dart';

class ForgetpassProvider extends GetConnect {

  GetStorage _getStorage = GetStorage('app_storage');

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> doForgetPassRequest(String email) async {
    var userData = new Map();
    userData['email'] = email;

    print("user data otp......" + userData.toString());
    //
    // var response =
    // await post(BASE_URL+"user-login", userData);


    var response =
    await post(BASE_URL+'user-forgot-password', userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("afterserver //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {

          await _getStorage.write('userID', response.body['emailotp']['user_id'].toString());

          return true;
        } else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<dynamic> verifyOtp(String number1, String number2, String number3,
      String number4, String number5) async {
    final String? emp_id = await _getStorage.read('userID');

    var userData = new Map();
    userData['user_id'] = emp_id;
    userData['otp'] = number1 + number2 + number3 + number4 + number5;

    print("user data otp......" + userData.toString());

    // var response = await post(
    //     BASE_URL+"login-otp-verification", userData);

    var response = await post(
        BASE_URL+"user-forgot-password-otp-verification", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }


  Future<dynamic> setNewPassword(String password, String confirmPass
      ) async {
    final String? emp_id = await _getStorage.read('userID');

    var userData = new Map();
    userData['user_id'] = emp_id;
    userData['new_password'] = password;
    userData['re_type_password'] = confirmPass;

    print("user data otp......" + userData.toString());

    // var response = await post(
    //     BASE_URL+"login-otp-verification", userData);

    // var response = await post(
    //     "http://172.31.120.238:80/api/change-user-forgot-password", userData);

    var response = await post(
        BASE_URL+"change-user-forgot-password", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
