import 'package:get/get.dart';

import '../controllers/alumni_book_controller.dart';

class AlumniBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlumniBookController>(
      () => AlumniBookController(),
    );
  }
}
