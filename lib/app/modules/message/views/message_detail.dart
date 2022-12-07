import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageDetails extends StatefulWidget {

  String? personName;
  String? type;
  String? datetime;
  String? smsdetails;

   MessageDetails(this.personName, this.type, this.datetime, this.smsdetails);

  @override
  State<MessageDetails> createState() => _MessageDetailsState(
    personName,type,datetime,smsdetails
  );
}

class _MessageDetailsState extends State<MessageDetails> {

  String? personName;
  String? type;
  String? datetime;
  String? smsdetails;

  _MessageDetailsState(this.personName, this.type, this.datetime, this.smsdetails);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff0FA958),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              )
            ),
            onPressed: () {},
          ),
          backgroundColor: Color(0xffE5E5E5),
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
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
              'Messages',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xff0FA958),
                  fontSize: screenHeigth * 0.017
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  height: screenHeigth * 0.001,
                  color: Color(0xff00602B),
                  width: screenWidth,
                ),
              ),
              Container(
                height: screenHeigth * 0.070,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 4,
                        color: Color(0xFF0FA958),
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 0),
                    ),
                    isScrollable: true,
                    labelColor: Colors.black,
                    tabs: [
                      Text("Inbox"),
                      Text("Sent items"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: screenHeigth * 0.010,
                          );
                        },
                        itemCount: 1,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              // Get.to(MessageDetails(
                              //   personName: personName,
                              //   type: type,
                              //   datetime: datetime,
                              //   smsdetails: smsdetails,
                              // ));
                            },
                            child: Container(
                              // height: screenHeigth * 0.150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: screenWidth * 0.040,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                children: [
                                                  Text(
                                                    "From : ${personName!}",
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontSize:
                                                      screenHeigth * 0.020,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_border,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.050,
                                                  ),
                                                  Text(
                                                    datetime!,
                                                    style: TextStyle(
                                                      fontSize:
                                                      screenHeigth * 0.015,
                                                      color: Color(0xff777777),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: screenHeigth * 0.010),
                                          // Type text..................................Typeeeee text
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  type!,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize:
                                                    screenHeigth * 0.018,
                                                    color: Color(0xff4F4F4F),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: screenHeigth * 0.020),

                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Flexible(
                                                // big text..................................big text
                                                child: Text(
                                                  smsdetails!,
                                                  maxLines: 5,
                                                  // overflow: TextOverflow.ellipsis,
                                                  // softWrap: true,
                                                  style: TextStyle(
                                                    fontSize:
                                                    screenHeigth * 0.015,
                                                    color: Color(0xff828282),
                                                  ),
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.star_border,
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenHeigth * 0.030,
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //   MainAxisAlignment.center,
                                          //   children: [
                                          //     Container(
                                          //       height: 50,
                                          //       width: screenWidth * 0.400,
                                          //       decoration: BoxDecoration(
                                          //           borderRadius:
                                          //           BorderRadius.all(
                                          //               Radius.circular(15)),
                                          //           border: Border.all(
                                          //             width: 2,
                                          //             color: Colors.black,
                                          //           )),
                                          //       child: Center(
                                          //         child: Text(
                                          //           "DONATE NOW",
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          // Text(
                                          //   "Attachment",
                                          //   style: TextStyle(
                                          //     color: Color(0xff333333),
                                          //     fontSize: 12,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Text("Sent items"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
