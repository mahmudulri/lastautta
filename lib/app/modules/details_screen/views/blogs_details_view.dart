import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utill/constant.dart';
import '../../base/views/base_view.dart';
import '../../home/controllers/home_controller.dart';

class BlogsDetailsView extends StatefulWidget{

  var index = Get.arguments;

  @override
  State<BlogsDetailsView> createState() => _BlogsDetailsViewState();
}

class _BlogsDetailsViewState extends State<BlogsDetailsView> {


  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.to(
                      ()=>BaseView()
              );
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
            'Blogs & Article',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xff0FA958),
                  fontSize: screenHeight * 0.015
              ),
            ),
          ),
        ),
        body: Obx(() => controller.isBlogLoading.value == true ? Container(
          height: screenHeight,
          width: screenWidth,
          child: Center(
            child: Container(
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
          ),
        ):  Padding(
          padding:  EdgeInsets.only(
            left: screenHeight * 0.020,
            right: screenHeight * 0.020,
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Divider(
                    color: titleTextColor,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              controller.allBlog.value.articleBlogs![int.parse(widget.index.toString())].subcategoryName.toString().toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                fontSize: screenHeight * 0.017,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                          Text(
                            controller.allBlog.value.articleBlogs![int.parse(widget.index.toString())].createdAt.toString().substring(0,15),
                            style: GoogleFonts.poppins(
                              fontSize: screenHeight * 0.016,
                              color: Color(0xff4F4F4F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    children: [
                      Container(
                        height: screenHeight * 0.050,
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEFEFEF),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              controller.allBlog.value.articleBlogs![int.parse(widget.index.toString())].categoryName.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenHeight * 0.018,
                                  color: Color(0xff4F4F4F),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.020,
                      ),
                      Container(
                        height: screenHeight * 0.050,
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEFEFEF),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              controller.allBlog.value.articleBlogs![int.parse(widget.index.toString())].subcategoryName.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenHeight * 0.018,
                                  color: Color(0xff4F4F4F),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),

                  Container(
                      height: screenHeight * 0.250,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:  FadeInImage(
                        placeholder: AssetImage('assets/images/notice.jpg'), image: NetworkImage(
                        IMAGE_HEADER+controller.allBlog.value.articleBlogs![int.parse(widget.index.toString())].articleBlogImage.toString(),
                      ),
                        fit: BoxFit.cover,)
                  ),

                  SizedBox(
                    height: screenHeight * 0.010,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(data: controller.allBlog.value.articleBlogs![int.parse(widget.index.toString())].articleBlogDescription.toString(),
                    ),
                  )
                ],
              );
            },
          ),
        ),)

      ),
    );
  }
}
