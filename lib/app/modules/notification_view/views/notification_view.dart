import 'package:aust_textile_alumni/app/modules/base/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/notification_view_controller.dart';

class NotificationView extends GetView<NotificationViewController> {
  // const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    String longText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ut scelerisque dui purus sit amet sem.";
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xffff00602B)));

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: screenHeigth * 0.100,
            flexibleSpace: Container(
              // height: screenHeigth * 0.120,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff00602B),
                    Color(0xff0FA958),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Get.to(
                                () => BaseView()
                            );
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: screenWidth * 0.070,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: screenWidth * 0.070,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Notifications",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            elevation: 0.0,
          ),
          backgroundColor: Color(0xffE5E5E5),
          body: Column(
            children: [
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: screenHeigth * 0.005,
                    );
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return notification_box(
                      screenWidth: screenWidth,
                      longText: longText,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class notification_box extends StatelessWidget {
  const notification_box({
    Key? key,
    required this.screenWidth,
    required this.longText,
  }) : super(key: key);

  final double screenWidth;
  final String longText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: screenWidth,
        child: Column(
          children: [
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Color(0xff777777),
                      size: screenWidth * 0.030,
                    ),
                    Text(
                      '24 Feb 2020',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: Color(0xff777777),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Text(
                      '10.12 AM',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: Color(0xff777777),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Icon(
                        Icons.notifications,
                        color: Colors.red.withOpacity(0.50),
                        size: screenWidth * 0.100,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notification Title",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                          Text(
                            longText,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.025,
                                color: Color(0xff777777),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
