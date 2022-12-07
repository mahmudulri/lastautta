import 'package:aust_textile_alumni/app/modules/user_post/controllers/mypost_controller.dart';
import 'package:aust_textile_alumni/app/widget/all_post_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utill/app_colors.dart';
import '../../../widget/filter_post_list.dart';
import '../../../widget/general_post_list.dart';
import '../../../widget/job_post_list.dart';


class MypostView extends StatefulWidget {
  const MypostView({Key? key}) : super(key: key);

  @override
  State<MypostView> createState() => _MypostViewState();
}

class _MypostViewState extends State<MypostView> {

  MypostController controller = Get.put(MypostController());


  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2000, 11, 01),
    end: DateTime(2050, 11, 11),
  );

  Future pickDateRange()  async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (newDateRange == null) return;
    setState(()  {
      dateRange = newDateRange;
      // controller.pickedDateRange.value = dateRange.toString();
      // controller.startDate.value = dateRange.toString().substring(0,10);
      // controller.endDate.value = dateRange.toString().substring(26,36);

      // print('date range .....'+controller.pickedDateRange.value.toString());
      // print('date range .....'+controller.startDate.value.toString());
      // print('date range .....'+controller.endDate.value.toString());
    });
    controller.pickedDateRange.value = dateRange.toString();
    controller.startDate.value = dateRange.toString().substring(0,10);
    controller.endDate.value = dateRange.toString().substring(26,36);

    print('date range .....'+controller.pickedDateRange.value.toString());
    print('date range .....'+controller.startDate.value.toString());
    print('date range .....'+controller.endDate.value.toString());

    await controller.fetchUserAllFilterPost();
  }


  @override
  Widget build(BuildContext context) {

     controller.fetchUserAllPost();
     controller.fetchUserJobPost();
     controller.fetchUserGlobalPost();

    final start = dateRange.start;
    final end = dateRange.end;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: _onRefreshDataLoad,
      strokeWidth: 0.0,
      displacement: 0.0,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.020,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              height: screenHeight * 0.070,
              width: screenWidth - 20,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffE5E5E5),
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 3.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      0.0, // Move to bottom 5 Vertically
                    ),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.search,
                        size: screenHeight * 0.035,
                        // color: Color(0xff777777),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.030,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_month,color: Colors.grey,),
                SizedBox(
                  width: screenWidth * 0.020,
                ),
                InkWell(
                  onTap: () {
                    pickDateRange();
                  },
                  child: Text(
                      '${start.year}-${start.month.toString()}-${start.day}'),
                ),
                SizedBox(
                  width: screenWidth * 0.010,
                ),
                Text("-"),
                SizedBox(
                  width: screenWidth * 0.010,
                ),
                InkWell(
                  onTap: () {
                    pickDateRange();
                  },
                  child: Text(
                      '${end.year}-${end.month}-${end.day}'),
                ),
                Spacer(),
                Obx(() => Text(controller.postType.value.toString()),),
                SizedBox(
                  width: screenWidth * 0.010,
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Filter post type',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                  ),
                                ),),
                                Divider(
                                  color: titleTextColor,
                                ),
                                SizedBox(height: screenHeight * 0.015,),
                                GestureDetector(
                                  onTap:(){
                                    controller.postType.value = 'All Post';
                                    controller.pickedDateRange.value = "";
                                     setState(() {
                                       dateRange = DateTimeRange(
                                         start: DateTime(2000, 11, 01),
                                         end: DateTime(2050, 11, 11),
                                       );
                                     });
                                    Navigator.of(context).pop();
                                   },
                                  child: Text('All Post',style:GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                  ),
                                  ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.010,),
                                GestureDetector(
                                  onTap:(){
                                    controller.postType.value = 'General Post';
                                    controller.pickedDateRange.value = "";
                                    setState(() {
                                      dateRange = DateTimeRange(
                                        start: DateTime(2000, 11, 01),
                                        end: DateTime(2050, 11, 11),
                                      );
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('General Post',style:GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                    ),
                                  ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.010,),
                                GestureDetector(
                                  onTap:(){
                                    controller.postType.value = 'Job Post';
                                    controller.pickedDateRange.value = "";
                                    setState(() {
                                      dateRange = DateTimeRange(
                                        start: DateTime(2000, 11, 01),
                                        end: DateTime(2050, 11, 11),
                                      );
                                    });
                                    Navigator.of(context).pop();
                                   },
                                  child: Text('Job Post',style:GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                    ),
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          );

                        });
                  },
                  child: Icon(
                    Icons.filter_list,
                  ),
                ),
              ],
            ),
          ),
          // Post List....................................../Post List....................................../Post list post list Start
          SizedBox(
            height: screenHeight * 0.050,
          ),
          Expanded(
            child: Obx(() =>
           controller.pickedDateRange.value != "" ?
           filterpost_list(
             screenWidth: screenWidth,
             screenHeigth: screenHeight,
             controller: controller,
           )
               :
            controller.postType.value == 'General Post' ?
              generalpost_list(
                screenWidth: screenWidth,
                screenHeigth: screenHeight,
                controller: controller,
              ) :  controller.postType.value == 'Job Post' ?
              jobpost_list(
                screenWidth: screenWidth,
                screenHeigth: screenHeight,
                controller: controller,
              ) :  allpost_list(
              screenWidth: screenWidth,
              screenHeigth: screenHeight,
              controller: controller,
            ),
             )

          ),
          // Text("feature working ......",style: GoogleFonts.poppins(),)
        ],
      ),
    );
  }

  Future<void> _onRefreshDataLoad() async {
    Future.delayed(const Duration(seconds: 3));
    await controller.fetchUserAllPost();
    await controller.fetchUserJobPost();
  }
}
