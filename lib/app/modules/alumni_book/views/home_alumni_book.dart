import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/alumni_list.dart';
import '../../base/views/base_view.dart';

class HomeAlumniBook extends StatefulWidget {
  // const HomeAlumniBook({Key? key}) : super(key: key);

  @override
  State<HomeAlumniBook> createState() => _HomeAlumniBookState();
}

class _HomeAlumniBookState extends State<HomeAlumniBook> {
  var location = [
    'Dhaka',
    'Barishal',
    'Khulna',
    'Comila',
    'Chattogram',
    'Mymensingh',
    'Rajshahi',
    'Rangpur',
    'Sylhet',
  ].obs;

  var selectLocation;

  var companyName = [
    'Pakiza Technovation Limited',
    'Brain Station 23',
    'Kona Sl',
    'Welldev',
    'Spring Rain',
    'Radisson Digital Technologies',
    'Datasoft Limited',
  ].obs;

  var selectcompanyName;

  var department = [
    'CSE',
    'EEE',
    'Textile',
    'Civil',
    'ECE',
    'English',
  ].obs;

  var selectDepartmentName;

  var batch = [
    '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th',
    '9th',
    '10th',
  ].obs;

  var selectBatchName;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.1),
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Color(0xffE5E5E5),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Alumni",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: screenHeight * 0.020,
                  color: Color(0xff0FA958),
                ),
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xff00602B),
                  height: 2.0,
                ),
              ),
              preferredSize: Size.fromHeight(4.0),
            ),
          ),
          body: Container(
            height: screenHeight,
            color: Colors.white.withOpacity(0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenHeight * 0.023, right: screenHeight * 0.023),
                  child: Container(
                    height: screenHeight * 0.07,
                    width: double.infinity,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: screenHeight * 0.015),
                            child: Icon(
                              Icons.search,
                              size: screenHeight * 0.035,
                            )),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: screenHeight * 0.010,
                                right: screenWidth * 0.040),
                            child: Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Text"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.035),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.only(
                                          left: screenHeight * 0.025,
                                          right: screenHeight * 0.025,
                                          top: screenHeight * 0.10,
                                          bottom: screenHeight * 0.10),
                                      backgroundColor: Color(0xff00602B),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            left: screenHeight * 0.015),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Filter your search',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: screenHeight * 0.027,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Spacer(),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        screenHeight * 0.022),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                      'assets/images/alert_cancel.png'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      content: StatefulBuilder(
                                        builder: (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                          return Container(
                                            height: screenHeight,
                                            width: screenWidth,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: screenHeight * 0.020,
                                                ),
                                                Container(
                                                  height: screenHeight * 0.070,
                                                  // width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: screenHeight *
                                                              0.019,
                                                          right: screenHeight *
                                                              0.019),
                                                      child: Obx(
                                                        () => DropdownButton<
                                                            String>(
                                                          hint: Text(
                                                            "Location",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          value: selectLocation,
                                                          icon: Padding(
                                                            padding: EdgeInsets.only(
                                                                top:
                                                                    screenHeight *
                                                                        0.010),
                                                            child: Image.asset(
                                                                'assets/images/arrow_down.png'),
                                                          ),
                                                          iconSize: 20,
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                          items: location.map(
                                                              (quantityValue) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    quantityValue,
                                                                child: Text(
                                                                    quantityValue
                                                                        .toString()));
                                                          }).toList(),
                                                          onChanged: (val) {
                                                            setState(() {
                                                              this.selectLocation =
                                                                  val;
                                                              print("locaaaaaaaaaaaaaa" +
                                                                  selectLocation
                                                                      .toString());
                                                            });
                                                          },
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.010,
                                                ),
                                                Container(
                                                  height: screenHeight * 0.070,
                                                  // width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: screenHeight *
                                                              0.019,
                                                          right: screenHeight *
                                                              0.019),
                                                      child: Obx(
                                                        () => DropdownButton<
                                                            String>(
                                                          hint: Text(
                                                            "Company Name",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          value: this
                                                              .selectcompanyName,
                                                          icon: Padding(
                                                            padding: EdgeInsets.only(
                                                                top:
                                                                    screenHeight *
                                                                        0.010),
                                                            child: Image.asset(
                                                                'assets/images/arrow_down.png'),
                                                          ),
                                                          iconSize: 20,
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                          onChanged:
                                                              (chosenValue) {
                                                            setState(() {
                                                              selectcompanyName =
                                                                  chosenValue
                                                                      .toString();
                                                            });
                                                          },
                                                          items: companyName.map(
                                                              (quantityValue) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    quantityValue,
                                                                child: Text(
                                                                    quantityValue));
                                                          }).toList(),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.010,
                                                ),
                                                Container(
                                                  height: screenHeight * 0.070,
                                                  // width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: screenHeight *
                                                              0.019,
                                                          right: screenHeight *
                                                              0.019),
                                                      child: Obx(
                                                        () => DropdownButton<
                                                            String>(
                                                          hint: Text(
                                                            "Department",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          value: this
                                                              .selectDepartmentName,
                                                          icon: Padding(
                                                            padding: EdgeInsets.only(
                                                                top:
                                                                    screenHeight *
                                                                        0.010),
                                                            child: Image.asset(
                                                                'assets/images/arrow_down.png'),
                                                          ),
                                                          iconSize: 20,
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                          onChanged:
                                                              (chosenValue) {
                                                            setState(() {
                                                              selectDepartmentName =
                                                                  chosenValue
                                                                      .toString();
                                                            });
                                                          },
                                                          items: department.map(
                                                              (quantityValue) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    quantityValue,
                                                                child: Text(
                                                                    quantityValue));
                                                          }).toList(),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.010,
                                                ),
                                                Container(
                                                  height: screenHeight * 0.070,
                                                  // width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: screenHeight *
                                                              0.019,
                                                          right: screenHeight *
                                                              0.019),
                                                      child: Obx(
                                                        () => DropdownButton<
                                                            String>(
                                                          hint: Text(
                                                            "Batch No",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          value: this
                                                              .selectBatchName,
                                                          icon: Padding(
                                                            padding: EdgeInsets.only(
                                                                top:
                                                                    screenHeight *
                                                                        0.010),
                                                            child: Image.asset(
                                                                'assets/images/arrow_down.png'),
                                                          ),
                                                          iconSize: 20,
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                          onChanged:
                                                              (chosenValue) {
                                                            setState(() {
                                                              selectBatchName =
                                                                  chosenValue
                                                                      .toString();
                                                            });
                                                          },
                                                          items: batch.map(
                                                              (quantityValue) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    quantityValue,
                                                                child: Text(
                                                                    quantityValue));
                                                          }).toList(),
                                                        ),
                                                      )),
                                                ),
                                                Spacer(),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        shape: MaterialStateProperty
                                                            .all(
                                                                RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      08.0),
                                                        ))),
                                                    onPressed: () {},
                                                    child: Center(
                                                      child: Text(
                                                        "Filter",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  });
                            },
                            child: Image.asset(
                                'assets/images/alumni_search_filter.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenHeight * 0.019,
                  ),
                  child: Text(
                    'Search terms',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.010,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenHeight * 0.019,
                  ),
                  child: Text(
                    'Alumni found 201',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                // Tabbar started

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: screenHeight * 0.050,
                    child: TabBar(
                      // indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFF000000),
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 0),
                      ),
                      isScrollable: true,
                      labelColor: Colors.black,
                      tabs: [
                        Text(
                          "Alumnai",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        Text(
                          "Stuffs",
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
                SizedBox(
                  height: screenHeight * 0.010,
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      AlumniList('alumni_book'),
                      AlumniList('alumni_book'),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
