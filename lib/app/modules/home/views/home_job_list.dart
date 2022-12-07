import 'package:aust_textile_alumni/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'job_details_view.dart';

// class HomeJobList extends StatelessWidget {
//   // const JobList({Key? key}) : super(key: key);
//
//   HomeController controller = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//     return Obx(() => controller.isJobPostLoading.value == true  ?
//     Center(
//       child:Container(
//         color: Colors.white,
//         height: screenHeight * 0.25,
//         width: screenHeight * 0.25,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Center(
//                 child: Lottie.asset("assets/files/loading.json")
//             ),
//             Text("Please wait ....",style: GoogleFonts.poppins(
//                 color: Colors.grey
//             ),)
//           ],
//         ),
//       ),
//     ) : ListView.separated(
//       physics: BouncingScrollPhysics(),
//       shrinkWrap: true,
//       separatorBuilder: (context, index) {
//         return SizedBox(
//           height: screenHeight * 0.010,
//         );
//       },
//       itemCount: controller.jobPost.value.latestJobs!.length,
//       itemBuilder: (_, index) {
//         return Container(
//           height: screenHeight * 0.100,
//           width: screenWidth - 50,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//             color: Color(0xFFffffff),
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0xffE5E5E5),
//                 blurRadius: 5.0, // soften the shadow
//                 spreadRadius: 3.0, //extend the shadow
//                 offset: Offset(
//                   0.0, // Move to right 5  horizontally
//                   0.0, // Move to bottom 5 Vertically
//                 ),
//               ),
//             ],
//           ),
//           // child: Center(child: const Text("Hello world")),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/employee_icon.png'),
//                 SizedBox(width: screenWidth * 0.018,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: screenHeight * 0.019),
//                       child: Text(
//                         controller.jobPost.value.latestJobs![index].jobTitle.toString(),
//                         style: GoogleFonts.poppins(
//                             fontSize: screenHeight * 0.017,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     SizedBox(),
//                     Padding(
//                       padding: EdgeInsets.only(left: screenHeight * 0.019),
//                       child: Row(
//                         children: [
//                           Image.asset('assets/images/job_bag.png'),
//                           SizedBox(
//                             width: screenHeight * 0.015,
//                           ),
//                           Text(
//                             controller.jobPost.value.latestJobs![index].applicationDeadline.toString(),
//                             style: TextStyle(
//                               fontSize: screenHeight * 0.015,
//                               color: Colors.grey,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: EdgeInsets.only(right: screenHeight * 0.010),
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(() => HomeJobDetailsView(),arguments: index);
//                     },
//                     child: Container(
//                       height: screenHeight * 0.040,
//                       // width: screenHeight * 0.10,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         border: Border.all(color: Colors.green, width: 1),
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             left: 10,
//                             right: 10,
//                           ),
//                           child: Text(
//                             "view details",
//                             style: GoogleFonts.poppins(
//                                 color: Colors.grey,
//                                 fontSize: screenHeight * 0.013),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     ));
//   }
// }