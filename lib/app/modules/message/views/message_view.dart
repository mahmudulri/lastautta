import 'package:aust_textile_alumni/app/modules/base/views/base_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/message_controller.dart';
import 'message_detail.dart';

class MessageView extends StatefulWidget {
    // MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {

  var personName = "Rezaul Karim";
  var type = "Donatiion";
  var datetime = "13 sep 2022, 10.05 am";
  var smsdetails =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper justo in sem fermentum malesuada. consectetur adipiscing elit. Donec semper justo in sem fermentum malesuada. Phasellus sed turpis sit amet ipsum imperdiet fringilla.";



  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
        length: 3,
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
            onPressed: () {
               // Get.to(MessageDetails());
            },
          ),
          backgroundColor: Color(0xffE5E5E5),
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Get.to(
                    ()=> BaseView()
                );
                print("clicked");
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
                    fontSize: screenHeigth * 0.017,
                    color: Color(0xff0FA958),
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
                      Text(
                        "Inbox",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      Text(
                        "Sent items",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Importants",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.star_border,
                            size: 20,
                          ),
                        ],
                      ),
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
                        itemCount: 6,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(MessageDetails(
                                personName,
                                type,
                                datetime,
                                smsdetails,
                              ));
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
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffB7E5CD),
                                          ),
                                          height: screenHeigth * 0.150,
                                          width: screenWidth * 0.150,
                                          child: Icon(Icons.chat),
                                        ),
                                      ],
                                    ),
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
                                              Flexible(
                                                child: Text(
                                                  personName,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize:
                                                    screenHeigth * 0.020,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                datetime,
                                                style: TextStyle(
                                                  fontSize: screenHeigth * 0.015,
                                                  color: Color(0xff777777),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  type,
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
                                          SizedBox(height: 5),

                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  smsdetails,
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
                                              Icon(
                                                Icons.star_border,
                                              ),
                                            ],
                                          )
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
                    Center(
                      child: Text('Important'),
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
