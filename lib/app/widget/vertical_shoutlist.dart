import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../modules/alumni_book/views/alumni_book_view.dart';
import '../modules/details_screen/views/shout_details.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/job/views/job_view.dart';
import '../modules/message/views/message_view.dart';
import '../modules/user_post/views/user_post_view.dart';
import '../routes/app_pages.dart';
import '../utill/app_colors.dart';
import '../utill/constant.dart';

class VerticalPostList extends StatefulWidget {
  // const VerticalPostList({Key? key}) : super(key: key);

  @override
  State<VerticalPostList> createState() => _VerticalPostListState();
}

class _VerticalPostListState extends State<VerticalPostList> {

  HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    // controller.fetchAllPost();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
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
            "Shout",
            style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: screenHeight * 0.017
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(
                left: screenHeight * 0.022,
                right: screenHeight * 0.022,
              ),
              child: Container(
                height: screenHeight * 0.001,
                color: Colors.green,
                width: screenWidth,
              ),
            ),
            SizedBox(height: screenHeight * 0.010,),

            Obx(() => controller.isAllPostLoading.value == true ? Center(
              child:Container(
                color: Colors.white,
                height: screenHeight * 0.25,
                width: screenHeight * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                        child: Lottie.asset("assets/files/loading.json")
                    ),
                    Text("Please wait ....",style: GoogleFonts.poppins(
                        color: Colors.grey
                    ),)
                  ],
                ),
              ),
            ) :
            Expanded(child:  ListView.builder(
                itemCount: controller.allPost.value.posts!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: (){
                          Get.to(
                                  () => ShoutsDetailsView(),
                              arguments: index
                          );
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xFFffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffE5E5E5),
                              blurRadius: 5.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 5  horizontally
                                0.0, // Move to bottom 5 Vertically
                              ),
                            ),
                          ],
                        ),
                        height: screenHeight * 0.25,
                        width: screenHeight * 0.42,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: screenHeight * 0.019),
                                      child: FadeInImage(
                                        image: NetworkImage(
                                            IMAGE_HEADER+controller.allPost.value.posts![index].image.toString()
                                        ),
                                        placeholder: AssetImage(
                                            'assets/images/dubai.png'
                                        ),
                                        height: screenHeight * 0.22,
                                        width: screenHeight * 0.10,
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.030,
                                          left: screenHeight * 0.015),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenHeight * 0.015
                                                ),
                                                child: Text(
                                                  controller.allPost.value.posts![int.parse(index.toString())].postTitle.toString().length > 21 ?
                                                  controller.allPost.value.posts![int.parse(index.toString())].postTitle.toString().substring(0,20)+"..." :   controller.allPost.value.posts![int.parse(index.toString())].postTitle.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: screenHeight * 0.015),
                                                ),
                                              ),
                                              Padding(
                                                padding:EdgeInsets.only(
                                                    right: screenHeight * 0.015
                                                ),
                                                child: Text(
                                                  controller.allPost.value.posts![index].createdAt.toString().substring(0,10),
                                                  overflow: TextOverflow.clip,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.grey,
                                                      fontSize: screenHeight * 0.014),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.020,
                                          ),
                                          Container(
                                            width: screenHeight * 0.28,
                                            height: screenHeight * 0.16,
                                            child: Html(data: controller.allPost.value.posts![int.parse(index.toString())].postDescription.toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },)))

          ],
        ),
      ),
    );
  }
}
