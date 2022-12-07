import 'package:aust_textile_alumni/app/modules/details_screen/views/news_details_view.dart';
import 'package:aust_textile_alumni/app/modules/details_screen/views/upcoming_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../modules/details_screen/views/blogs_details_view.dart';
import '../modules/home/controllers/home_controller.dart';
import '../utill/constant.dart';

class CustomHorizontalList extends StatefulWidget {
  late double containerHeight;
  late double containerWidth;
  var viewType;

  CustomHorizontalList(double cHeight, double cWidth, view_type) {
    this.containerHeight = cHeight;
    this.containerWidth = cWidth;
    this.viewType = view_type;
  }

  @override
  State<CustomHorizontalList> createState() =>
      _CustomHorizontalListState(containerHeight, containerWidth, viewType);
}

class _CustomHorizontalListState extends State<CustomHorizontalList> {
  late double containerHeight;
  late double containerWidth;
  var viewType;

  HomeController controller = Get.put(HomeController());

  _CustomHorizontalListState(double cHeight, double cWidth, view_type) {
    this.containerHeight = cHeight;
    this.containerWidth = cWidth;
    this.viewType = view_type;
  }
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return Container(
      height: containerHeight,
      width: double.infinity,
      child: Obx(() => viewType == 'latest news' ?
      controller.isNewsLoading.value == true ?  Container(
        color: Colors.white,
        height: screenHeigth * 0.15,
        width: screenHeigth * 0.15,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeigth * 0.15,
                width: screenHeigth * 0.15,
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
      ) : ListView.builder(
          itemCount: viewType == 'latest news' ? controller.allNews.value.noticeNews!.length : controller.allBlog.value.articleBlogs!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                viewType == "latest news"
                    ? Get.to(() => NewsDetailsView(),arguments: index)
                    : Get.to(() => BlogsDetailsView(),arguments: index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffE5E5E5),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      ),
                    ],
                  ),
                  height: containerHeight,
                  width: containerWidth,
                  child: viewType == 'latest news' ?
                  Stack(
                    children: [
                      Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                          IMAGE_HEADER+controller.allNews.value.noticeNews![index].noticeNewsImage.toString(),
                        ),
                          fit: BoxFit.cover,),
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
                                child: Text(controller.allNews.value.noticeNews![index].categoryName.toString(),
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
                                    Text(controller.allNews.value.noticeNews![index].subcategoryName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeigth * 0.013,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ):
                  Stack(
                    children: [
                      Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                          IMAGE_HEADER+controller.allBlog.value.articleBlogs![index].articleBlogImage.toString(),
                        ),
                          fit: BoxFit.cover,),
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
                                child: Text(controller.allBlog.value.articleBlogs![index].articleBlogTitle.toString(),
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
                                    Text(controller.allBlog.value.articleBlogs![index].subcategoryName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeigth * 0.013,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
          : controller.isBlogLoading.value == true ?  Container(
        color: Colors.white,
        height: screenHeigth * 0.15,
        width: screenHeigth * 0.15,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeigth * 0.15,
                width: screenHeigth * 0.15,
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
      ) :
      ListView.builder(
          itemCount: viewType == 'latest news' ? controller.allNews.value.noticeNews!.length : controller.allBlog.value.articleBlogs!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                viewType == "latest news"
                    ? Get.to(() => NewsDetailsView(),arguments: index)
                    : Get.to(() => BlogsDetailsView(),arguments: index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffE5E5E5),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      ),
                    ],
                  ),
                  height: containerHeight,
                  width: containerWidth,
                  child: viewType == 'latest news' ?
                  Stack(
                    children: [
                      Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                          IMAGE_HEADER+controller.allNews.value.noticeNews![index].noticeNewsImage.toString(),
                        ),
                          fit: BoxFit.cover,),
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
                                child: Text(controller.allNews.value.noticeNews![index].categoryName.toString(),
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
                                    Text(controller.allNews.value.noticeNews![index].subcategoryName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeigth * 0.013,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ):
                  Stack(
                    children: [
                      Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                          IMAGE_HEADER+controller.allBlog.value.articleBlogs![index].articleBlogImage.toString(),
                        ),
                          fit: BoxFit.cover,),
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
                                child: Text(controller.allBlog.value.articleBlogs![index].articleBlogTitle.toString(),
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
                                    Text(controller.allBlog.value.articleBlogs![index].subcategoryName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeigth * 0.013,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
      )
     
    );
  }
}
