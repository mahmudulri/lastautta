import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utill/constant.dart';

class OtpProvider extends GetConnect {

  GetStorage _getStorage = GetStorage('app_storage');

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> verifyOtp(String number1, String number2, String number3,
      String number4, String number5) async {
    final String? emp_id = await _getStorage.read('employee_id');

    var userData = new Map();
    userData['user_id'] = emp_id;
    userData['otp'] = number1 + number2 + number3 + number4 + number5;

    print("user data otp......" + userData.toString());

    // var response = await post(
    //     BASE_URL+"login-otp-verification", userData);

    // var response = await post(
    //     "http://172.31.120.238:80/api/login-otp-verification", userData);

    var response = await post(
        BASE_URL+'login-otp-verification', userData);

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
