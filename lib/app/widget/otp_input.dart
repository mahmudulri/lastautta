import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../modules/otp/controllers/otp_controller.dart';

class OtpBox extends StatelessWidget {
  late String digitNo;

  OtpBox(String serialNo) {
    digitNo = serialNo;
  }
   final OtpController controller = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff0FA958),
            borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              digitNo == '1'
                  ? controller.digit1.value = value.toString()
                  : digitNo == '2'
                  ? controller.digit2.value = value.toString()
                  : digitNo == '3'
                  ? controller.digit3.value = value.toString()
                  : digitNo == '4'
                  ? controller.digit4.value = value.toString()
                  : controller.digit5.value = value.toString();
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ),
    );
  }
}