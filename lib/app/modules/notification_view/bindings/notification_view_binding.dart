import 'package:get/get.dart';

import '../controllers/notification_view_controller.dart';

class NotificationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationViewController>(
      () => NotificationViewController(),
    );
  }
}
