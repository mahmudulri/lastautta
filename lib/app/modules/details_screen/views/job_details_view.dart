import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utill/app_colors.dart';
import '../../base/views/base_view.dart';
import '../../job/controllers/job_controller.dart';

class JobDetailsView extends GetView {

  var index = Get.arguments;

  JobController controller = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              // Get.to(
              //         ()=>BaseView()
              // );
              Get.back();
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
            'Jobs',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xff0FA958),
                fontSize: screenHeigth * 0.015
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Obx(() => controller.isJobPostLoading.value == true ?
            Container(
              height: screenHeigth,
              width: screenWidth,
              child: Center(
                child: Container(
                  color: Colors.white,
                  height: screenHeigth * 0.25,
                  width: screenHeigth * 0.25,
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
            ): Column(
              children: [
                Divider(
                  color: titleTextColor,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: screenHeigth * 0.015,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (controller.jobPost.value?.latestJobs![int.parse(index.toString())].jobTitle).toString().toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeigth * 0.017,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                        Text(
                            (controller.jobPost.value?.latestJobs![int.parse(index.toString())].createdAt).toString().substring(0,10),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeigth * 0.016,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeigth * 0.020,
                ),
                Row(
                  children: [
                    Container(
                      height: screenHeigth * 0.050,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEFEFEF),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                           ( controller.jobPost.value?.latestJobs![int.parse(index.toString())].typeName).toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenHeigth * 0.016,
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
                      height: screenHeigth * 0.050,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEFEFEF),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                           ( controller.jobPost.value?.latestJobs![int.parse(index.toString())].deptName).toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenHeigth * 0.016,
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
                  ],
                ),
                SizedBox(
                  height: screenHeigth * 0.020,
                ),

                SizedBox(
                  height: screenHeigth * 0.020,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company Name",
                          style: GoogleFonts.poppins(
                            fontSize: screenHeigth * 0.020,
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                         ( controller.jobPost.value?.latestJobs![int.parse(index.toString())].companyName).toString(),
                          style: GoogleFonts.poppins(
                            fontSize: screenHeigth * 0.018,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeigth * 0.020,
                ),
                Row(
                  children: [
                    Text(
                      "Job Context",
                      style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.020,
                        color: Color(0xff4F4F4F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(data:( controller.jobPost.value?.latestJobs![int.parse(index.toString())].jobDescription).toString(),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeigth * 0.030,
                ),

                Divider(
                  thickness: 1.0,
                  color: Color(0xffBDBDBD),
                ),
                Row(
                  children: [
                    Text(
                      "Application deadline : ",
                      style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.020,
                        color: Color(0xff4F4F4F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                    (  controller.jobPost.value?.latestJobs![int.parse(index.toString())].applicationDeadline).toString(),
                      style: GoogleFonts.poppins(
                        fontSize: screenHeigth * 0.018,
                        color: Color(0xff4F4F4F),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeigth * 0.010,
                ),

                SizedBox(
                  height: screenHeigth * 0.030,
                ),
                GestureDetector(
                  onTap: () async {
                    try{
                      String? jobLink =  controller.jobPost.value?.latestJobs![int.parse(index.toString())].jobLink.toString();
                      var url = Uri.parse('mailto: $jobLink }');
                      print("mail...\t"+url.toString())  ;
                      await launchUrl(url);

                    }
                    catch(e){
                      print(e.toString());
                    }

                  },
                  child: Container(
                    height: screenHeigth * 0.080,
                    width: screenWidth - 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("Buy event ticket"),
                        SizedBox(
                          width: screenWidth * 0.010,
                        ),
                        Text("Apply now",
                            style: GoogleFonts.poppins(
                              fontSize: screenHeigth * 0.016,
                              color: Colors.black,
                            )),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 8.0,
                          endIndent: 8.0,
                        ),
                        SizedBox(
                          width: screenWidth * 0.010,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "100 %",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenHeigth * 0.018,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "complete",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenHeigth * 0.018,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
