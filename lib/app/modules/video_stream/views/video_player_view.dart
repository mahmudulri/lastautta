import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_stream_controller.dart';

class VideoPlayerview extends StatefulWidget {
  // const VideoPlayerview({Key? key}) : super(key: key);

  @override
  State<VideoPlayerview> createState() => _VideoPlayerviewState();
}

class _VideoPlayerviewState extends State<VideoPlayerview> {

  VideoStreamController controller = Get.put(VideoStreamController());

  // late VlcPlayerController _videoPlayerController;

 //  final VideoPlayerController videoPlayerController =
 //  VideoPlayerController.network("https://media.w3.org/2010/05/sintel/trailer.mp4",
 // );



  // ChewieController? chewieController;

  // Future<void> initializePlayer() async {}

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    // videoPlayerController.initialize();
    // chewieController = ChewieController(
    //   videoPlayerController: videoPlayerController,
    //   aspectRatio: 16 / 9,
    //   autoPlay: true,
    //   looping: true,
    //   autoInitialize: true,
    //   showControls: false,
    // );

    super.initState();
    initPlayer();

    // _videoPlayerController = VlcPlayerController.network(
    //   'https://media.w3.org/2010/05/sintel/trailer.mp4',
    //    hwAcc: HwAcc.FULL,
    //   autoPlay: true,
    //   options: VlcPlayerOptions(),
    // );
  }

  @override
  void dispose() async {
    videoPlayerController.dispose();
    chewieController?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
     super.dispose();
    // await _videoPlayerController.stopRendererScanning();
    // await _videoPlayerController.dispose();
    // videoPlayerController.dispose();
    // chewieController!.dispose();
  }

  void initPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4',
    videoPlayerOptions: VideoPlayerOptions(

    ));
     videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16/9,
      autoPlay: true,
      allowedScreenSleep: false,
      deviceOrientationsAfterFullScreen: [
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      ],
      optionsTranslation: OptionsTranslation(

      )



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
    chewieController!.addListener(() {
      if (chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Color(0xffE5E5E5),
            leading: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Video Section",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: screenHeight * 0.017,
                  color: Color(0xff0FA958),
                ),
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xff00602B),
                  height: 1.0,
                ),
              ),
              preferredSize: Size.fromHeight(4.0),
            ),
          ),
          body: Container(
            height: screenHeight,
            width: screenWidth,
            child: chewieController!=null? Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Chewie(
                controller: chewieController!,
              ),
            ) : Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
