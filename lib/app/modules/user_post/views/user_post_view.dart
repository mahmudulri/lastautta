import 'dart:io';
import 'package:aust_textile_alumni/app/modules/home/controllers/home_controller.dart';
import 'package:aust_textile_alumni/app/modules/user_post/model/chip_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/views/test_view.dart';
import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../job/controllers/job_controller.dart';
import '../controllers/user_post_controller.dart';
import 'general_post.dart';
import 'job_post.dart';
import 'mypost_view.dart';

class UserPostView extends StatefulWidget {
  @override
  State<UserPostView> createState() => _UserPostViewState();
}

class _UserPostViewState extends State<UserPostView> {

  var selectedItem;

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2000, 11, 01),
    end: DateTime(2050, 11, 11),
  );


  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  UserPostController controller = Get.put(UserPostController());
  HomeController homeController = Get.put(HomeController());

  JobController jobController = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    final start = dateRange.start;
    final end = dateRange.end;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              homeController.fetchAllPost();
              jobController.fetchUserJobPost();
              Get.toNamed(Routes.BASE);

            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Post",
            style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: screenHeigth * 0.017
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(
                left: screenHeigth * 0.022,
                right: screenHeigth * 0.022,
              ),
              child: Container(
                height: screenHeigth * 0.001,
                color: Colors.green,
                width: screenWidth,
              ),
            ),
            Container(
              height: screenHeigth * 0.070,
              width: screenWidth,
              decoration: BoxDecoration(
                // color: Color(0xffE5E5E5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBar(
                  // indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF0FA958),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Text(
                      "General post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Text(
                      "Job post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Text(
                      "My post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GeneralPostView(),
                  JobPostView(),
                  MypostView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
