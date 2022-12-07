import 'dart:convert';

import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utill/constant.dart';
import '../model/event_model.dart';

class EventProvider extends GetConnect {

  GetStorage _getStorage = GetStorage('app_storage');


  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<EventModel?> getEventPost() async {

    final String? logInToken = _getStorage.read('token');

    // final String? logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    // var response = await get(
    //     'http://172.31.120.238:80/api/all-event-posts',
    //     headers: {'Authorization': 'Bearer $logInToken'}
    // );

    var response = await get(
        BASE_URL+'all-event-posts',
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());

          var jsonString = response.body;
          print("response,,,,,,,,,,,,,,,,,,,,,"+jsonString.toString());
          return EventModel.fromJson(jsonString);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

  Future<dynamic>  doEventPay() async {

    Map<String, dynamic> userData = Map();
    userData['name'] = 'hasan12';
    userData['email'] = 'mahmudul12.ri@gmail.com';
    userData['phone'] = 01701987948;
    userData['amount'] =  200;
    userData['status'] = 'pending';
    userData['transaction_id'] = 123;

    final String? logInToken = _getStorage.read('token');



    //
    // userData['store_id'] = 'pakiz6369e82f78658';
    // userData['store_passwd'] = 'pakiz6369e82f78658@ssl';
    // userData['total_amount'] = '200';
    // userData['currency'] = 'BDT';
    // userData['tran_id'] = 'REF123';
    // userData['success_url'] = 'http://yoursite.com/success.php';
    // userData['fail_url'] = 'http://yoursite.com/fail.php';
    // userData['cancel_url'] = 'http://yoursite.com/cancel.php';
    // userData['cus_name'] = 'rakib';
    // userData['cus_email'] = 'mahmudul.ri@gmail.com';
    // userData['cus_add1'] = 'Dhaka';
    // userData['cus_city'] = 'Dhaka';
    // userData['cus_state'] = 'Dhaka';
    // userData['cus_postcode'] = '1000';
    // userData['cus_country'] = 'Bangladesh';
    // userData['cus_phone'] = '01701987948';
    // userData['ship_name'] = 'Customer Name';
    // userData['ship_add1 '] = 'Dhaka';
    // userData['ship_city'] = 'Dhaka';
    // userData['ship_state'] = 'Dhaka';
    // userData['ship_postcode'] = '1000';
    // userData['ship_country'] = 'Bangladesh';
    // userData['multi_card_name'] = 'mastercard,visacard,';


    //
    // var response =
    //     await post('http://172.31.120.238:80/api/pay-via-ajax', userData);

    var response =
    await post(BASE_URL+'pay-via-ajax',userData);



    print("status body //////////" + response.body.toString());

    if (response.statusCode == 200) {

      print("status body111111111111 //////////" + response.toString());


      var finalResponse = jsonDecode(response.body.toString());

      try {
        if (finalResponse['status'] == 'success') {

          print("afterserver //////////" + response.body.toString());
          // await _getStorage.write('token', response.body['token']);
          // await _getStorage.write('userID', response.body['user_id'].toString());

          return true;
        } else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }

  }

  // Future<void> sslCommerzGeneralCall() async {
  //   Sslcommerz sslcommerz = Sslcommerz(
  //     initializer: SSLCommerzInitialization(
  //       //Use the ipn if you have valid one, or it will fail the transaction.
  //       ipn_url: "www.ipnurl.com",
  //       multi_card_name: 'mastercard,visacard',
  //       currency: SSLCurrencyType.BDT,
  //       product_category: "Food",
  //       sdkType: SSLCSdkType.TESTBOX,
  //       store_id: 'pakiz6369e82f78658',
  //       store_passwd: 'pakiz6369e82f78658@ssl',
  //       total_amount: 200.00,
  //       tran_id: "1231123131212",
  //     ),
  //   );
  //   try {
  //     SSLCTransactionInfoModel result = await sslcommerz.payNow();
  //
  //     if (result.status!.toLowerCase() == "failed") {
  //       // Fluttertoast.showToast(
  //       //   msg: "Transaction is Failed....",
  //       //   toastLength: Toast.LENGTH_SHORT,
  //       //   gravity: ToastGravity.CENTER,
  //       //   timeInSecForIosWeb: 1,
  //       //   backgroundColor: Colors.red,
  //       //   textColor: Colors.white,
  //       //   fontSize: 16.0,
  //       // );
  //     } else if (result.status!.toLowerCase() == "closed") {
  //       // Fluttertoast.showToast(
  //       //   msg: "SDK Closed by User",
  //       //   toastLength: Toast.LENGTH_SHORT,
  //       //   gravity: ToastGravity.CENTER,
  //       //   timeInSecForIosWeb: 1,
  //       //   backgroundColor: Colors.red,
  //       //   textColor: Colors.white,
  //       //   fontSize: 16.0,
  //       // );
  //     } else {
  //     //   Fluttertoast.showToast(
  //     //       msg:
  //     //       "Transaction is ${result.status} and Amount is ${result.amount}",
  //     //       toastLength: Toast.LENGTH_SHORT,
  //     //       gravity: ToastGravity.CENTER,
  //     //       timeInSecForIosWeb: 1,
  //     //       backgroundColor: Colors.black,
  //     //       textColor: Colors.white,
  //     //       fontSize: 16.0);
  //     // }
  //   }
  //
  // }
  //   catch (e) {
  //     // debugPrint(e.toString());
  //   }
}
