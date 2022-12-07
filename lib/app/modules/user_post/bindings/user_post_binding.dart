import 'package:get/get.dart';

import 'package:aust_textile_alumni/app/modules/user_post/controllers/mypost_controller.dart';
import 'package:aust_textile_alumni/app/modules/user_post/controllers/update_post_controller.dart';

import '../controllers/user_post_controller.dart';

class UserPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePostController>(
      () => UpdatePostController(),
    );
    Get.lazyPut<MypostController>(
      () => MypostController(),
    );
    Get.lazyPut<UserPostController>(
      () => UserPostController(),
    );
  }
}
