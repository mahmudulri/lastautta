import 'dart:convert';

import 'package:delta_to_html/delta_to_html.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../utill/app_colors.dart';
import '../../../widget/custom_feild_title.dart';
import '../controllers/mypost_controller.dart';
import '../controllers/update_post_controller.dart';
import '../controllers/user_post_controller.dart';
import '../model/job_dept_model.dart';
import '../model/jobpost_type_model.dart';

class EditJobPostView extends StatefulWidget {
  // const JobPostView({Key? key}) : super(key: key);

  var index = Get.arguments;

  @override
  State<EditJobPostView> createState() => _EditJobPostViewState();
}

class _EditJobPostViewState extends State<EditJobPostView> {

  var selectedDept;
  var selectedJobTpe;
  var selectedJobLocation;

  late QuillController quillController;


  UpdatePostController controller =  Get.put(UpdatePostController());

  MypostController _mypostController =  Get.put(MypostController());



  @override
  Widget build(BuildContext context) {




    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    // controller.fetchUserAllPost();

    // controller.updateJobField(widget.index);


    quillController.document.changes.listen((event) {
      var jsonDelta = quillController.document.toDelta().toJson();
      var deltaHtml = DeltaToHTML.encodeJson(jsonDelta);
      var htmlToString = deltaHtml.toString();

      controller.jobDescription.value = htmlToString;

       print("texxxxxxxxxxxxx......."+controller.jobDescription.value .toString());
    });

    // print("texxxxxxxxxxxxx......."+controller.dropDownJobPostDept.value .toString());


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: getFieldTitle('Job post', screenHeigth),
          centerTitle: true,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Divider(
              height: 2.0,
              color: titleTextColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Obx(() => controller.isAllPostLoading.value == true ?  Align(
                alignment: Alignment.center,
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
                      getLoadingTitle(),
                    ],
                  ),
                ),
              ) : Column(
                children: [
                  SizedBox(
                    height: screenHeigth * 0.015,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Update a job post",screenHeigth)
                    ],
                  ),

                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Job title *", screenHeigth),
                    ],
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Container(
                    height: screenHeigth * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeigth * 0.019,
                          right: screenHeigth * 0.019),
                      child: TextFormField(
                        controller: TextEditingController(
                            text: controller.allPost.value.userAllPosts![0].jobPost![widget.index].jobTitle.toString()
                        ),
                        decoration: InputDecoration(
                          // hintText: "Enter job title",
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: (value) {
                          controller.jobTitle.value =
                              value.toString();
                        },
                      ),
                    ),
                  ),

                  Obx(() {
                    controller.json.value = controller.allPost.value.userAllPosts![0].jobPost![widget.index].jobDescription.toString();
                    return Row(
                      children: [
                        Visibility(child: getFieldTitle(controller.jobTitle.value.toString(),screenHeigth))
                      ],
                    );
                  }),

                  SizedBox(
                    height: screenHeigth * 0.030,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle( "Company name *", screenHeigth)
                    ],
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Container(
                    height: screenHeigth * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeigth * 0.019,
                          right: screenHeigth * 0.019),
                      child: TextFormField(
                        controller: TextEditingController(
                            text: controller.allPost.value.userAllPosts![0].jobPost![widget.index].companyName.toString()
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: (value) {
                          controller.companyName.value =
                              value.toString();
                          print("commmmmmm"+controller.companyName.value.toString());
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Departments *", screenHeigth),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Obx(() {
                      controller.jobDept.value = controller.allPost.value.userAllPosts![0].jobPost![widget.index].departmentId.toString();
                      return DropdownSearch<Department?>(
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(
                        hintStyle:
                        const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        hintText: controller.allPost.value.userAllPosts![0].jobPost![widget.index].departmentId.toString(),

                      ),
                      items: controller.jobPostDept,
                      itemAsString: (Department? type) =>
                          type!.departmentName.toString(),
                      onChanged: (data ){
                        controller.jobDept.value = data!.id.toString();
                        print("...............data"+controller.jobDept.value.toString());
                      },
                      //show selected item
                    );
                    })
                    // DropdownButton<String>(
                    //   isExpanded: true,
                    //   icon: Icon(
                    //     Icons.arrow_drop_down,
                    //   ),
                    //   hint: getPlainText(controller.allPost.value.userAllPosts![0].jobPost![widget.index].departmentId.toString()),
                    //   onChanged: (val) {
                    //     controller.jobDept.value = controller.allPost.value.userAllPosts![0].jobPost![widget.index].departmentId.toString();
                    //     controller.jobDept.value = val.toString();
                    //     setState(
                    //             () => selectedDept = val.toString());
                    //     print("deeepppppppppart"+controller.jobDept.value.toString());
                    //     print("deeepppppppppart"+controller.dropDownJobPostDept.value.toString());
                    //
                    //   },
                    //   value: this.selectedDept,
                    //   items: controller.dropDownJobPostDept.map((selectValue) {
                    //     return DropdownMenuItem(
                    //         value: selectValue,
                    //         child: Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: screenHeigth * 0.019),
                    //             child: getDropdownTitle(selectValue)
                    //         )
                    //     );
                    //   }).toList(),
                    // ),
                  ),

                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Job descriptions *", screenHeigth)
                    ],
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  //....................................................Job Description Box End
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenHeigth * 0.010,
                              right: screenHeigth * 0.010,
                              top: screenHeigth * 0.025,
                              bottom: screenHeigth * 0.025
                          ),
                          child: QuillToolbar.basic(controller: quillController),
                        ),
                        Divider(
                          thickness: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: screenHeigth * 0.35,
                            width: screenWidth - 20,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color(0xffC4C4C4),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QuillEditor(
                                controller: quillController,
                                readOnly: false,
                                scrollController: ScrollController(),
                                scrollable: true,
                                autoFocus: false,
                                expands: true,
                                padding: EdgeInsets.all(10), focusNode: FocusNode(),),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getFieldTitle("Job Type *", screenHeigth),
                          Container(
                            height: screenHeigth * 0.070,
                            width: screenWidth * 0.400,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xffC4C4C4),
                                  width: 2),
                            ),
                            child: Obx(() {
                              controller.jobType.value = controller.allPost.value.userAllPosts![0].jobPost![widget.index].jobType.toString();
                              return Center(
                                child: Padding(
                                  padding:  EdgeInsets.only(
                                    left: screenWidth * 0.030,
                                  ),
                                  child: DropdownSearch<JobType?>(
                                    mode: Mode.MENU,
                                    dropdownSearchDecoration: InputDecoration(
                                      hintStyle:
                                      const TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      hintText: controller.allPost.value.userAllPosts![0].jobPost![widget.index].jobType.toString()

                                    ),
                                    items: controller.jobPostType,
                                    itemAsString: (JobType? type) =>
                                        type!.typeName.toString(),
                                    onChanged: (data ){
                                      controller.jobType.value = data!.id.toString();
                                      print("...............data"+controller.jobType.value.toString());
                                    },
                                    //show selected item
                                  ),
                                ),
                              );
                            })
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton<String>(
                            //     // underline: SizedBox(),
                            //     isExpanded: true,
                            //     icon: Icon(
                            //       Icons.arrow_drop_down,
                            //     ),
                            //     hint: Padding(
                            //       padding: EdgeInsets.only(
                            //         left: screenHeigth * 0.010
                            //       ),
                            //       child: getPlainText(controller.allPost.value.userAllPosts![0].jobPost![widget.index].jobType.toString()),
                            //     ),
                            //     onChanged: (val) {
                            //
                            //       controller.jobType.value = val.toString();
                            //       setState(() =>
                            //       selectedJobTpe = val.toString());
                            //       print(controller.postType.value
                            //           .toString());
                            //     },
                            //     value: this.selectedJobTpe,
                            //     items: controller.dropDownJobPostItem
                            //         .map((selectValue) {
                            //       return DropdownMenuItem(
                            //           value: selectValue,
                            //           child: Padding(
                            //               padding: EdgeInsets.only(
                            //                   left: screenHeigth * 0.019),
                            //               child: getDropdownTitle(selectValue)
                            //           )
                            //       );
                            //     }).toList(),
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getFieldTitle("Job Location *", screenHeigth),
                          Container(
                            height: screenHeigth * 0.070,
                            width: screenWidth * 0.400,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xffC4C4C4),
                                  width: 2),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                // underline: SizedBox(),
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                ),
                                hint: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenHeigth * 0.010
                                  ),
                                  child: getPlainText(controller.allPost.value.userAllPosts![0].jobPost![widget.index].jobLocation.toString()),
                                ),
                                onChanged: (val) {
                                  controller.jobLocation.value = val.toString();
                                  setState(() =>
                                  selectedJobLocation = val.toString());
                                  print(controller.jobLocation.value
                                      .toString());
                                },
                                value: this.selectedJobLocation,
                                items: controller.dropDownJobLocationItem
                                    .map((selectValue) {
                                  return DropdownMenuItem(
                                      value: selectValue,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                            screenHeigth * 0.019),
                                        child: getFieldTitle(selectValue, screenHeigth),
                                      ));
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeigth * .020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Application deadline *", screenHeigth)
                    ],
                  ),

                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Container(
                    height: screenHeigth * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: screenHeigth * 0.019,
                            right: screenHeigth * 0.019),
                        child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            getFieldTitle(controller.allPost.value.userAllPosts![0].jobPost![widget.index].applicationDeadline.toString(), screenHeigth),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                controller.chooseApplicationDeadLine();
                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ))


                    ),
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Contact mail *", screenHeigth)
                    ],
                  ),
                  SizedBox(
                    height: screenHeigth * .020,
                  ),
                  Container(
                    height: screenHeigth * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeigth * 0.019,
                          right: screenHeigth * 0.019),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contact mail",
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: (value) {
                          controller.jobLink.value =
                              value.toString();
                          print("commmmmmm"+controller.jobLink.value.toString());
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),
                  // Obx(() => GestureDetector(
                  //   onTap: () async {
                  //     controller.getFile();
                  //   },
                  //   child: Container(
                  //     height: screenHeigth * 0.080,
                  //     width: screenWidth - 20,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         width: 1,
                  //         color: Color(0xff0FA958),
                  //       ),
                  //       // color: Color(0xff27AE60),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: controller.fileName.value == "" ?
                  //     Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           'Upload File',
                  //           style: GoogleFonts.poppins(
                  //               fontWeight: FontWeight.w400,
                  //               fontSize: screenHeigth * 0.020,
                  //               color: Color(0xff0FA958)),
                  //         ),
                  //         Text(
                  //           '(any supporting document)',
                  //           style: GoogleFonts.poppins(
                  //               fontWeight: FontWeight.w400,
                  //               fontSize: screenHeigth * 0.015,
                  //               color: Color(0xff0FA958)),
                  //         )
                  //       ],
                  //     ) : Center(
                  //       child: Text(
                  //         controller.fileName.value.toString(),
                  //         style: GoogleFonts.poppins(
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: screenHeigth * 0.015,
                  //             color: Color(0xff0FA958)),
                  //       ),
                  //     ),
                  //
                  //   ),
                  // )),
                  // SizedBox(
                  //   height: screenHeigth * .020,
                  // ),

                  Obx(() {
                    controller.selectedJobImagePath.value = controller.allPost.value.userAllPosts![0].jobPost![widget.index].image.toString();
                    return GestureDetector(
                      onTap: () async {
                        controller.getImage("job");
                      },
                      child: Container(
                        height: screenHeigth * 0.080,
                        width: screenWidth - 20,
                        decoration: BoxDecoration(
                          color: Color(0xff27AE60),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: controller.selectedJobImagePath.value == ""
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getAttachImageTitle(
                                'Upload Company Logo', screenHeigth),
                            getAttachImageTypeTitle(
                                '(.jpg .jpeg .png .gif only)', screenHeigth)
                          ],
                        )
                            : Center(
                            child: getAttachImageTypeTitle(
                                controller.showJobImageName.value.toString(),
                                screenHeigth)
                        ),
                      ),
                    );
                  }
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),

                  // ToggleSwitch(
                  //   cornerRadius: 10,
                  //   minWidth: screenWidth * 0.400,
                  //   minHeight: screenHeigth * 0.070,
                  //   fontSize: screenHeigth * 0.018,
                  //   initialLabelIndex: 1,
                  //   activeBgColor: [
                  //     Color(
                  //       0xff00602B,
                  //     )
                  //   ],
                  //   activeFgColor: Colors.white,
                  //   inactiveBgColor: Color(0xff0FA958),
                  //   inactiveFgColor: Colors.white,
                  //   totalSwitches: 2,
                  //   labels: ['Draft', 'Post'],
                  //   onToggle: (index) async {
                  //     print('switched to: $index');
                  //     if (index == 1) {
                  //       if (controller.jobTitle.value == '' &&
                  //           controller.companyName.value == '' &&
                  //           controller.jobType.value == '' &&
                  //           controller.jobDescription.value == '' &&
                  //           controller.jobDept.value == '' &&
                  //           controller.jobLocation.value == '' &&
                  //           controller.application_deadline == 'Select application deadline') {
                  //         Get.snackbar(
                  //           "Error",
                  //           "Fill up all the require field",
                  //           colorText: Colors.white,
                  //           backgroundColor: Color(0xff00602B),
                  //           snackPosition: SnackPosition.BOTTOM,
                  //         );
                  //       } else if (controller.jobTitle.value  == '' ||
                  //           controller.companyName.value == '' ||
                  //           controller.jobType.value == '' ||
                  //           controller.jobDescription.value == '' ||
                  //           controller.jobDept.value == '' ||
                  //           controller.jobLocation.value == '' ||
                  //           controller.application_deadline == 'Select application deadline') {
                  //         Get.snackbar(
                  //           "Error",
                  //           "Fill up all the require field",
                  //           colorText: Colors.white,
                  //           backgroundColor: Color(0xff00602B),
                  //           snackPosition: SnackPosition.BOTTOM,
                  //         );
                  //       } else {
                  //         await controller.uploadUserJobPost();
                  //         await _mypostController.fetchUserAllPost();
                  //         await _mypostController.fetchUserJobPost();
                  //       }
                  //
                  //     }
                  //     else {
                  //       if(controller.jobTitle.value == '' &&
                  //           controller.companyName.value == '' &&
                  //           controller.jobType.value == '' &&
                  //           controller.jobDescription.value == '' &&
                  //           controller.jobDept.value == '' &&
                  //           controller.jobLocation.value == '' &&
                  //           controller.application_deadline == 'Select application deadline'){
                  //         Get.snackbar(
                  //           "Error",
                  //           "Fill up all the field",
                  //           colorText: Colors.white,
                  //           backgroundColor:Color(0xff00602B),
                  //           snackPosition: SnackPosition.BOTTOM,
                  //
                  //         );
                  //       }
                  //       else if (
                  //       controller.jobTitle.value  == '' ||
                  //           controller.companyName.value == '' ||
                  //           controller.jobType.value == '' ||
                  //           controller.jobDescription.value == '' ||
                  //           controller.jobDept.value == '' ||
                  //           controller.jobLocation.value == '' ||
                  //           controller.application_deadline == 'Select application deadline'
                  //       ){
                  //         Get.snackbar(
                  //           "Error",
                  //           "Fill up all the field",
                  //           colorText: Colors.white,
                  //           backgroundColor:Color(0xff00602B),
                  //           snackPosition: SnackPosition.BOTTOM,
                  //
                  //         );
                  //       }
                  //       else {
                  //         await controller.draftUserJobPost();
                  //       }
                  //     }
                  //   },
                  // ),
                  SizedBox(
                      height: screenHeigth * 0.070,
                      width: screenWidth * 0.78,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Color(0xff00602B),
                        ),
                        onPressed: () {
                        },
                        child: getButtonTitle('Share'),
                      )
                  ),
                  SizedBox(
                    height: screenHeigth * 0.020,
                  ),

                ],
              )),
            ),
            Obx(() => controller.isProcessing.value == true
                ?   Align(
              alignment: Alignment.center,
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
                    getLoadingTitle(),
                  ],
                ),
              ),
            ) : Visibility(
                visible: false,
                child: Container()))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {



    // var json  =  jsonDecode(controller.json.value.toString());
    // final doc = Document.fromJson(json);

    final doc = Document();
    quillController = QuillController(
      document: doc, selection: TextSelection.collapsed(offset: 0),
    );
  }

  @override
  void dispose() {
    quillController.dispose();
  }
}
