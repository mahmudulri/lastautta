import 'package:get/get.dart';

import '../controllers/video_stream_controller.dart';

class VideoStreamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoStreamController>(
      () => VideoStreamController(),
    );
  }
}
