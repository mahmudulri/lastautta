import 'package:aust_textile_alumni/app/modules/base/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../model/event_model.dart';
import '../providers/event_provider.dart';
import '../views/qr_scaned_view.dart';

class EventController extends GetxController {
  //TODO: Implement EventController

  final count = 0.obs;

  final GlobalKey qrKey = GlobalKey();
  Barcode? result;
  QRViewController? controller;
  var isOpen = false.obs;

  var isPaymentComplete = false.obs;

  var isEventPostLoading = false.obs;
  var event = EventModel().obs;


  var isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
    fetchEventPost();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller?.dispose();
  }
  void increment() => count.value++;


  Future<void> onQRViewCreated(QRViewController controller) async {

    this.controller = controller;
    controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) async {
      controller.dispose();
      this.result = scanData;
      if(result != null){
        await controller.stopCamera();
        controller.getCameraInfo().whenComplete(() => controller.dispose());
        Get.to(() => QRScanedView());
      }
    });
  }


  Future<void> fetchEventPost() async {
    isEventPostLoading.value = true;
    try{
      var eventPosts = await EventProvider().getEventPost();
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


  Future<void> checkPayment() async {

    isLoading.value = true;

    var status = await EventProvider().doEventPay();
    print("login status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      isPaymentComplete.value = true;
      Get.snackbar(
        "Status",
        "Payment Successfull",
        colorText: Colors.white,
        backgroundColor: Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );

    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not Payment",
        colorText: Colors.white,
        backgroundColor: Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }
}
