import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes/app_pages.dart';


class AlumniList extends StatefulWidget {
  // const AlumniList({Key? key}) : super(key: key);

  var viewType;

  AlumniList(String view_type) {
    this.viewType = view_type;
  }

  @override
  State<AlumniList> createState() => _AlumniListState(viewType);
}

class _AlumniListState extends State<AlumniList> {
  var viewType;

  _AlumniListState(String view_type) {
    this.viewType = view_type;
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: screenHeight * 0.006,
          );
        },
        itemCount: viewType == 'home' ? 2 : 7,
        shrinkWrap: true,
        physics: viewType == 'home'
            ? NeverScrollableScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) async {},
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                if (direction == DismissDirection.endToStart) {
                  String url = "tel://" + '01850824850';

                  try {
                    // if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                    // }
                    // else {
                    throw 'Could not call 01850824850';
                    // }
                  } catch (e) {
                    print(e.toString());
                  }
                }
                return false;
              }
              if (direction == DismissDirection.startToEnd) {
                Get.offNamed(Routes.MESSAGE);
              }

            },
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.green,
              height: screenHeight * 0.10,
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.080),
                child: Image.asset(
                  "assets/images/phone_icon.png",
                  height: screenHeight * 0.10,
                  width: screenHeight * 0.10,
                )

              ),
            ),
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.orangeAccent,
              height: screenHeight * 0.10,
              child: Padding(
                padding: EdgeInsets.only(right: screenHeight * 0.30),
                child: Icon(
                  Icons.mail_outlined,
                  color: Colors.white,
                  size: screenHeight * 0.05,
                )
              ),
            ),
            child: Container(
                color: alumniListBackColor,
                width: double.infinity,
                height: screenHeight * 0.17,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.019),
                      child: CircleAvatar(
                        radius: screenHeight * 0.050,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: screenHeight * 0.015,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.029),
                          child: Text(
                            'Mostofa Chowdhury',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight * 0.014),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Text(
                          'Batch 11, 2005-2011',
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              // fontWeight: FontWeight.w700,
                              fontSize: screenHeight * 0.013),
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Row(
                          children: [
                            Icon(Icons.my_location,
                                color: Colors.grey, size: screenHeight * 0.013),
                            SizedBox(
                              width: screenHeight * 0.010,
                            ),
                            Text(
                              'Bangladesh',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.w700,
                                  fontSize: screenHeight * 0.013),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Row(
                          children: [
                            Icon(Icons.shopping_bag_outlined,
                                color: Colors.grey, size: screenHeight * 0.013),
                            SizedBox(
                              width: screenHeight * 0.010,
                            ),
                            Text(
                              'Xyz limited',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.w700,
                                  fontSize: screenHeight * 0.013),
                            )
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.019,
                            top: screenHeight * 0.012),
                        child: Icon(Icons.facebook_sharp,
                            color: Colors.grey, size: screenHeight * 0.040),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.012,
                            left: screenHeight * 0.005),
                        child: Icon(Icons.mail_outlined,
                            color: Colors.grey, size: screenHeight * 0.040),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.012,
                            left: screenHeight * 0.005),
                        child: GestureDetector(
                          onTap: () async {
                            String url = "tel://" + '01850824850';

                            try {
                              // if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                              // }
                              //   else {
                              throw 'Could not call 01850824850';
                              // }
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          child: Icon(Icons.phone_in_talk_sharp,
                              color: Colors.grey, size: screenHeight * 0.040),
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
