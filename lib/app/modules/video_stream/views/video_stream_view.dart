import 'package:aust_textile_alumni/app/modules/video_stream/views/video_player_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/video_stream_controller.dart';

class VideoStreamView extends StatelessWidget {

  List<String> catagories = [
    "Entertainment",
    "Sports",
    "Study",
    "Gamming",
    "Live Event",
    "Academic Tour"
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffE5E5E5),
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
                "Videos Section",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: screenHeigth * 0.017,
                    color: Color(0xff0FA958),
                  ),
                ),
              ),
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    color: Color(0xff00602B),
                    height: 2.0,
                  ),
                ),
                preferredSize: Size.fromHeight(4.0),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.blueGrey,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: catagories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(
                                      () => VideoPlayerview()
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(catagories[index]),
                                      ))),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: Container(
                      // color: Colors.lightBlueAccent,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(
                                      () => VideoPlayerview()
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // color: Colors.green,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                "assets/images/news.jpg",
                                                height: screenHeigth * 0.130,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Demo video from Pakiza technovation Limited",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("Posted by: " + " Pakiza knit"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("21 h ago"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
