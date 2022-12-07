import 'dart:async';

import 'package:aust_textile_alumni/app/modules/alumni_book/views/alumni_book_view.dart';
import 'package:aust_textile_alumni/app/modules/alumni_book/views/home_alumni_book.dart';
import 'package:aust_textile_alumni/app/modules/job/controllers/job_controller.dart';
import 'package:aust_textile_alumni/app/modules/notification_view/views/notification_view.dart';
import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:aust_textile_alumni/app/widget/alumni_list.dart';
import 'package:aust_textile_alumni/app/widget/custom_horizantal_list.dart';
import 'package:aust_textile_alumni/app/widget/horizontal_list.dart';
import 'package:aust_textile_alumni/app/widget/job_list.dart';
import 'package:aust_textile_alumni/app/widget/navigation_drawer.dart';
import 'package:aust_textile_alumni/app/widget/title_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utill/constant.dart';
import '../../../widget/upcoming_horizontal_list.dart';
import '../../../widget/vertical_news_list.dart';
import '../../../widget/vertical_blog_list.dart';
import '../../../widget/vertical_shoutlist.dart';
import '../../../widget/vertical_upcoming_list.dart';
import '../controllers/home_controller.dart';


class HomeView extends StatefulWidget {
  // const BaseView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeController controller = Get.put(HomeController());

  JobController jobController = Get.put(JobController());

   var addMiddleImages = <String> [];

  var addTopImages = <String> [];

  var addBottomImages = <String> [];

  var bannerImages = <String> [];
  
  var bannerIndex = 0.obs;




  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavigationDrawer(),
        floatingActionButton: Container(
          height: screenHeight * 0.06,
          decoration: BoxDecoration(
            border: Border.all(
              color: titleTextColor, //color of border
              width: 3, //width of border
            ),
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Get.toNamed(Routes.USER_POST);
            },
            child: Center(
              child: Image.asset(
                'assets/images/floating_icon.png',
                height: screenHeight * 0.050,
                width: screenHeight * 0.050,
              ),
            ),
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.019,
                        top: screenHeight * 0.019),
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Image.asset('assets/images/bar_icon.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.030,
                        top: screenHeight * 0.019),
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(
                        Routes.VIDEO_STREAM
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            right: screenHeight * 0.010,
                            top: screenHeight * 0.019),
                        child: Icon(
                          Icons.video_camera_back_outlined,
                          color: titleTextColor,
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenHeight * 0.034,
                        top: screenHeight * 0.019),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(
                            () => NotificationView()
                        );
                      },
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: titleTextColor,
                      ),
                    )
                    ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(
                              left: screenHeight * 0.025,
                              right: screenHeight * 0.025),
                          child: Divider(
                            color: titleTextColor,
                            height: 2.0,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        // first Banner................................../ First Banner..........///////////
                        Obx(() => controller.isBannerLoading.value == true ? Visibility(
                          visible: false,
                          child: Container(
                            color: Colors.white,
                            height: screenHeight * 0.20,
                            width: screenWidth,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.15,
                                    width: screenHeight * 0.15,
                                    child: Center(
                                        child: Lottie.asset("assets/files/loading.json")
                                    ),
                                  ),
                                  Text("Please wait ....",style: GoogleFonts.poppins(
                                      color: Colors.grey
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ) : Column(
                          children: [
                            getBannerSlider(0, screenWidth, screenHeight),
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            buildBannerDot(bannerImages.length),
                          ],
                        )),
                        SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        //............................................Up Coming ............................./
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: Row(
                            children: [
                              customTitleText('Upcomings', screenHeight * 0.020),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: screenHeight * 0.019),
                                child:
                                    GestureDetector(
                                        onTap: (){
                                          Get.to(
                                              () => VerticalUpcomingList(),
                                          );
                                        },
                                        child: customTitleText('view all', screenHeight * 0.016)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: UpcomingHorizontalList(
                              screenHeight * 0.20, screenHeight * 0.42, 'upcoming'),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Obx(() => controller.isAddPostLoading.value == true ?  Visibility(
                          visible: false,
                          child: Container(
                            color: Colors.white,
                            height: screenHeight * 0.20,
                            width: screenWidth,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: screenHeight * 0.15,
                                    width: screenHeight * 0.15,
                                    child: Center(
                                        child: Lottie.asset("assets/files/loading.json")
                                    ),
                                  ),
                                  Text("Please wait ....",style: GoogleFonts.poppins(
                                      color: Colors.grey
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ) : controller.topAdvertisement.value.id != null  ?
                        Visibility(
                          visible: controller.topAddVisibility.value,
                          child: Column(
                            children: [
                              getTopAddSlider(0, screenWidth,screenHeight),
                              SizedBox(height: screenHeight * 0.010,),
                              buildTopDot(addTopImages.length),
                            ],
                          ),
                        ) :Visibility(
                          visible: false,
                          child: Container())

                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: Row(
                            children: [
                              customTitleText('Latest News', screenHeight * 0.020),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: screenHeight * 0.019),
                                child:
                                    GestureDetector(
                                        onTap: (){
                                          Get.to(
                                              () => VerticalNewsList()
                                          );
                                        },
                                        child: customTitleText('view all', screenHeight * 0.016)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: CustomHorizontalList(screenHeight * 0.25,
                              screenHeight * 0.35, 'latest news'),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: Row(
                            children: [
                              customTitleText('Blogs', screenHeight * 0.020),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: screenHeight * 0.019),
                                child:
                                    GestureDetector(
                                        onTap: (){
                                          Get.to(
                                              () => VerticalNoticeList()
                                          );
                                        },
                                        child: customTitleText('view all', screenHeight * 0.016)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: CustomHorizontalList(
                              screenHeight * 0.25, screenHeight * 0.35, 'notice'),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: Row(
                            children: [
                              customTitleText('Jobs', screenHeight * 0.020),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: screenHeight * 0.019),
                                child:
                                    GestureDetector(
                                        onTap: (){
                                          Get.toNamed(Routes.JOB);
                                        },
                                        child: customTitleText('view all', screenHeight * 0.016)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenHeight * 0.019,
                            right: screenHeight * 0.019,
                          ),
                          child: Container
                            (child: JobList('home')),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: Row(
                            children: [
                              customTitleText('Shout', screenHeight * 0.020),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: screenHeight * 0.019),
                                child:
                                     GestureDetector(
                                         onTap: (){
                                           Get.to(VerticalPostList());
                                         },
                                         child: customTitleText('view all', screenHeight * 0.016)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenHeight * 0.019,
                            right: screenHeight * 0.019,
                          ),
                          child: Container(
                              width: screenWidth,
                              child: HorizontalList()),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Obx(() => controller.isAddPostLoading.value == true ?  Container(
                          color: Colors.white,
                          height: screenHeight * 0.20,
                          width: screenWidth,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: screenHeight * 0.15,
                                  width: screenHeight * 0.15,
                                  child: Center(
                                      child: Lottie.asset("assets/files/loading.json")
                                  ),
                                ),
                                Text("Please wait ....",style: GoogleFonts.poppins(
                                    color: Colors.grey
                                ),)
                              ],
                            ),
                          ),
                        ) : controller.middleAdvertisement.value.id != null ?
                        Visibility(
                          visible: controller.midAddVisibility.value,
                          child: Column(
                            children: [
                              getMiddleAddSlider(0, screenWidth,screenHeight),
                              SizedBox(height: screenHeight * 0.010,),
                              buildMiddleDot(addMiddleImages.length),
                            ],
                          ),
                        )
                                :Visibility(
                            visible: false,
                            child: Container())

                        ),
                        SizedBox( height: screenHeight * 0.020,),
                        Padding(
                          padding: EdgeInsets.only(left: screenHeight * 0.019),
                          child: Row(
                            children: [
                              customTitleText('Alumni', screenHeight * 0.020),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: screenHeight * 0.019),
                                child:
                                    GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.ALUMNI_BOOK);
                                          Get.to(
                                              ()=> HomeAlumniBook()
                                          );
                                        },
                                        child: customTitleText('view all', screenHeight * 0.016)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        AlumniList('home'),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Obx(() => controller.isAddPostLoading.value == true ?  Container(
                          color: Colors.white,
                          height: screenHeight * 0.20,
                          width: screenWidth,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: screenHeight * 0.15,
                                  width: screenHeight * 0.15,
                                  child: Center(
                                      child: Lottie.asset("assets/files/loading.json")
                                  ),
                                ),
                                Text("Please wait ....",style: GoogleFonts.poppins(
                                    color: Colors.grey
                                ),)
                              ],
                            ),
                          ),
                        ) : controller.bottomAdvertisement.value.id != null ?
                        Visibility(
                          visible: controller.bottomAddVisibility.value,
                          child: Column(
                            children: [
                              getBottomAddSlider(0, screenWidth,screenHeight),
                              SizedBox(height: screenHeight * 0.010,),
                              buildBottomDot(addBottomImages.length),
                            ],
                          ),
                        )
                              :Visibility(
                          visible: false,
                          child: Container())

                        ),
                        SizedBox(height: screenHeight * 0.010,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget getMiddleAddSlider(int index,double screenWidth,double screenHeight){

    // for(int i = 0 ; i< controller.advertisement.value.allAdvertisements![index].image.toString().length; i++){
    //   addImages = controller.advertisement.value.allAdvertisements![index].image.toString().split(',');
    // }

    // Timer(Duration(seconds: int.parse(controller.midShowTime.value.toString())), () async {
    //   controller.midAddVisibility.value = false;
    // }
    // );

    addMiddleImages = controller.middleAdvertisement.value.image.toString().split(',');

    for(int i = 0 ; i<addMiddleImages.length ; i++){
      addMiddleImages[i] = addMiddleImages[i].trim();
    }

    return CarouselSlider.builder(
        itemCount: addMiddleImages.length,
        itemBuilder: (context, index, realIndex) {
          var imageUrl = addMiddleImages[index];
          return buildMiddleImage(imageUrl, index,screenWidth,screenHeight);
        },
        options: CarouselOptions(
          aspectRatio: 6/2.7,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          onPageChanged: (index, realReason) {

            controller.currentMiddlePosition.value = index;
          },
        ));
  }


  Widget buildMiddleImage(String url, int index,double screenWidth,double screenHeigth) {
    return Stack(
      children: [
        Container(
            width: screenWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                    IMAGE_HEADER+url.toString()

              ),
              placeholder: AssetImage(
                  'assets/images/dubai.png'
              ),
            )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeigth * 0.060,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Text(
                    controller.middleAdvertisement.value.advertisementTitle.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.015,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:
                            controller.middleAdvertisement.value.redirectLink.toString(),
                            // controller.advertisement.value.allAdvertisements![0].redirectLink.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.clip,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () async {
                              var url =  controller.middleAdvertisement.value.redirectLink.toString();
                              // var url = controller.advertisement.value.allAdvertisements![0].redirectLink.toString();
                              launchUrl(Uri.parse(url));
                            }
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }


  Widget buildMiddleDot(int length ) =>
      Center(
        child: AnimatedSmoothIndicator(
          activeIndex: controller.currentMiddlePosition.value,
          count: length,
          effect: ScrollingDotsEffect(
            dotColor: Colors.black12,
            activeDotColor: Colors.black,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      );

  Widget getTopAddSlider(int index,double screenWidth,double screenHeight){

    // for(int i = 0 ; i< controller.advertisement.value.allAdvertisements![index].image.toString().length; i++){
    //   addImages = controller.advertisement.value.allAdvertisements![index].image.toString().split(',');
    // }

    // Timer(Duration(seconds: int.parse(controller.topShowTime.value.toString())), () async {
    //   controller.topAddVisibility.value = false;
    // }
    // );

    addTopImages = controller.topAdvertisement.value.image.toString().split(',');

    for(int i = 0 ; i<addTopImages.length ; i++){
      addTopImages[i] = addTopImages[i].trim();
    }

    return CarouselSlider.builder(
        itemCount: addTopImages.length,
        itemBuilder: (context, index, realIndex) {
          var imageUrl = addTopImages[index];
          return buildTopImage(imageUrl, index,screenWidth,screenHeight);
        },
        options: CarouselOptions(
          aspectRatio: 6/2.7,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          onPageChanged: (index, realReason) {

            controller.currentTopPosition.value = index;
          },
        ));
  }

  Widget buildTopImage(String url, int index,double screenWidth,double screenHeigth) {
    return Stack(
      children: [
        Container(
            width: screenWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  IMAGE_HEADER+url.toString()

              ),
              placeholder: AssetImage(
                  'assets/images/dubai.png'
              ),
            )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeigth * 0.060,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Text(
                    controller.topAdvertisement.value.advertisementTitle.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.015,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:
                            controller.topAdvertisement.value.redirectLink.toString(),
                            // controller.advertisement.value.allAdvertisements![0].redirectLink.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.clip,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () async {
                              var url =  controller.topAdvertisement.value.redirectLink.toString();
                              // var url = controller.advertisement.value.allAdvertisements![0].redirectLink.toString();
                              launchUrl(Uri.parse(url));
                            }
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildTopDot(int length ) =>
      Center(
        child: AnimatedSmoothIndicator(
          activeIndex: controller.currentTopPosition.value,
          count: length,
          effect: ScrollingDotsEffect(
            dotColor: Colors.black12,
            activeDotColor: Colors.black,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      );

  Widget getBottomAddSlider(int index,double screenWidth,double screenHeight){

    // for(int i = 0 ; i< controller.advertisement.value.allAdvertisements![index].image.toString().length; i++){
    //   addImages = controller.advertisement.value.allAdvertisements![index].image.toString().split(',');
    // }

    // Timer(Duration(seconds: int.parse(controller.bottomShowTime.value.toString())), () async {
    //   controller.bottomAddVisibility.value = false;
    // }
    // );

    addBottomImages = controller.bottomAdvertisement.value.image.toString().split(',');

    for(int i = 0 ; i<addBottomImages.length ; i++){
      addBottomImages[i] = addBottomImages[i].trim();
    }

    return CarouselSlider.builder(
        itemCount: addBottomImages.length,
        itemBuilder: (context, index, realIndex) {
          var imageUrl = addBottomImages[index];
          return buildBottomImage(imageUrl, index,screenWidth,screenHeight);
        },
        options: CarouselOptions(
          aspectRatio: 6/2.7,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          onPageChanged: (index, realReason) {

            controller.currentBottomPosition.value = index;
          },
        ));
  }

  Widget buildBottomImage(String url, int index,double screenWidth,double screenHeigth) {
    return Stack(
      children: [
        Container(
            width: screenWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  IMAGE_HEADER+url.toString()

              ),
              placeholder: AssetImage(
                  'assets/images/dubai.png'
              ),
            )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeigth * 0.060,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Text(
                    controller.bottomAdvertisement.value.advertisementTitle.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.015,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:
                            controller.bottomAdvertisement.value.redirectLink.toString(),
                            // controller.advertisement.value.allAdvertisements![0].redirectLink.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.clip,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () async {
                              var url =  controller.bottomAdvertisement.value.redirectLink.toString();
                              // var url = controller.advertisement.value.allAdvertisements![0].redirectLink.toString();
                              launchUrl(Uri.parse(url));
                            }
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildBottomDot(int length ) =>
      Center(
        child: AnimatedSmoothIndicator(
          activeIndex: controller.currentBottomPosition.value,
          count: length,
          effect: ScrollingDotsEffect(
            dotColor: Colors.black12,
            activeDotColor: Colors.black,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      );

  Widget getBannerSlider(int index,double screenWidth,double screenHeight){

    for(int i = 0 ; i< controller.allBanner.value.banner!.length; i++){
      bannerIndex.value = i;
      print('innnnnnnnnnnnnnnnnnnnnnnnn'+bannerIndex.value.toString());
      bannerImages.addAll(
          controller.allBanner.value.banner![i].image.toString().split(',')
      );

    }

    for(int i = 0 ; i<bannerImages.length ; i++){
      bannerImages[i] = bannerImages[i].trim();
    }

    print("lennnnnnnnnnngt"+bannerImages.toString());

    return CarouselSlider.builder(
        itemCount: bannerImages.length,
        itemBuilder: (context, index, realIndex) {
          var imageUrl = bannerImages[index];
          return buildBannerImage(imageUrl, index,screenWidth,screenHeight);
        },
        options: CarouselOptions(
          aspectRatio: 6/2.7,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          onPageChanged: (index, realReason) {
            controller.currentBannerPosition.value = index;
          },
        ));
  }

  Widget buildBannerImage(String url, int index,double screenWidth,double screenHeigth) {
    return Stack(
      children: [
        Container(
            width: screenWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  IMAGE_HEADER+url.toString()
                // url.toString()

              ),
              placeholder: AssetImage(
                  'assets/images/dubai.png'
              ),
            )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeigth * 0.060,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeigth * 0.005,
                      left: screenHeigth * 0.030
                  ),
                  child: Text(
                     // 'hello',
                     controller.allBanner.value.banner![int.parse(bannerIndex.value.toString())].bannerTitle.toString() ,
                         // == null ?
                    // controller.allBanner.value.banner![textIndex].bannerTitle.toString() :  controller.allBanner.value.banner![textIndex].eventTitle.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.015,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: screenHeigth * 0.005,
                //       left: screenHeigth * 0.030
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       RichText(
                //         text: TextSpan(
                //             text:
                //             'hello.com',
                //             // controller.bottomAdvertisement.value.redirectLink.toString(),
                //             style: TextStyle(
                //               color: Colors.white,
                //               overflow: TextOverflow.clip,
                //             ),
                //             recognizer: TapGestureRecognizer()..onTap = () async {
                //               var url =  controller.bottomAdvertisement.value.redirectLink.toString();
                //               // var url = controller.advertisement.value.allAdvertisements![0].redirectLink.toString();
                //               launchUrl(Uri.parse(url));
                //             }
                //         ),
                //       )
                //     ],
                //   ),
                // ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildBannerDot(int length ) =>
     Obx(() =>  Center(
       child: AnimatedSmoothIndicator(
         activeIndex: controller.currentBannerPosition.value,
         count: length,
         effect: ScrollingDotsEffect(
           dotColor: Colors.black12,
           activeDotColor: Colors.black,
           dotHeight: 10,
           dotWidth: 10,
         ),
       ),
     ));

}
