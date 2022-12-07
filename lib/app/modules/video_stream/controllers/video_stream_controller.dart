import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoStreamController extends GetxController {
  //TODO: Implement VideoStreamController


  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initPlayer();
  }

  void initPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      // additionalOptions: (context) {
      //   return <OptionItem>[
      //     OptionItem(
      //       onTap: () => debugPrint('Option 1 pressed!'),
      //       iconData: Icons.chat,
      //       title: 'Option 1',
      //     ),
      //     OptionItem(
      //       onTap: () =>
      //           debugPrint('Option 2 pressed!'),
      //       iconData: Icons.share,
      //       title: 'Option 2',
      //     ),
      //   ];
      // },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
  }
  void increment() => count.value++;
}
