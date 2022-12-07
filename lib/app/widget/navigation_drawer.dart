import 'package:aust_textile_alumni/app/modules/home/controllers/home_controller.dart';
import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:aust_textile_alumni/app/widget/vertical_shoutlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/alumni_book/views/home_alumni_book.dart';
import '../utill/constant.dart';

class NavigationDrawer extends StatefulWidget {
  // const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth * 0.55,
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Obx(() => controller.isUserInfoLoading.value == true ? Container(
                  height: screenHeight * 0.27,
                  color: Color(0xff00602B),
                  child: CircularProgressIndicator(),
                ) : Container(
                  height: screenHeight * 0.27,
                  color: Color(0xff00602B),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.027),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: screenHeight * 0.045,
                          backgroundImage:
                          controller.userInfo.value.userInfo!.image != null || controller.userInfo.value.userInfo!.image != '' ?
                          // FadeInImage(
                          //   placeholder: AssetImage('assets/images/user.png'), image: NetworkImage(
                          //   IMAGE_HEADER+controller.userInfo.value.userInfo!.image.toString(),
                          // ),
                          //   fit: BoxFit.cover,) as ImageProvider<Object>
                             NetworkImage(IMAGE_HEADER+controller.userInfo.value.userInfo!.image.toString())  as ImageProvider<Object>
                              :
                           AssetImage('assets/images/user.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.010,
                            left: screenHeight * 0.017,
                            right: screenHeight * 0.017),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.0,
                        ),
                      ),
                      Text(
                        controller.userInfo.value.userInfo!.nickName.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenHeight * 0.017,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.017,
                            right: screenHeight * 0.017),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.010,
                        ),
                        child: Text(
                          "Student",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenHeight * 0.015,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.010,
                        ),
                        child: Text(
                          "Tex Batch  "+controller.userInfo.value.userInfo!.batch.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenHeight * 0.015,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.USER_PROFILE);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenHeight * 0.020),
                        child: Icon(Icons.person,color: Colors.grey,size: screenHeight * 0.025,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenHeight * 0.012),
                        child: Text(
                          'My Profile',
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: screenHeight * 0.020),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(
                        ()=> HomeAlumniBook()
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenHeight * 0.020),
                        child: Icon(Icons.search,color: Colors.grey,size: screenHeight * 0.025),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenHeight * 0.012),
                        child: Text(
                          'Find an alumni',
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: screenHeight * 0.020),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(
                        ()=> VerticalPostList()
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenHeight * 0.020),
                        child:Icon(Icons.newspaper_outlined,color: Colors.grey,size: screenHeight * 0.025),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenHeight * 0.012),
                        child: Text(
                          'Shout/Post',
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: screenHeight * 0.020),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.012,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.020),
                      child: Icon(Icons.calendar_month,color: Colors.grey,size: screenHeight * 0.025),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.012),
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.EVENT);
                        },
                        child: Text(
                          'My Events',
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: screenHeight * 0.020),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.020),
                      child: Icon(Icons.wallet_giftcard,color: Colors.grey,size: screenHeight * 0.025),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.012),
                      child: Text(
                        'My Transactions',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: screenHeight * 0.020),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.012,bottom: screenHeight * 0.025),
                    child: Image.asset('assets/images/logout_icon.png',height:screenHeight * 0.025,
                    width:  screenHeight * 0.025),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.012,bottom: screenHeight * 0.025),
                    child: GestureDetector(
                      onTap: () async {
                        await controller.checkLogout();
                      },
                      child: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: screenHeight * 0.020),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
