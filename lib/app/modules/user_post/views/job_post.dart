
import 'package:aust_textile_alumni/app/modules/user_post/model/job_dept_model.dart';
import 'package:delta_to_html/delta_to_html.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../widget/custom_feild_title.dart';
import '../controllers/mypost_controller.dart';
import '../controllers/user_post_controller.dart';
import '../model/jobpost_type_model.dart';

class JobPostView extends StatefulWidget {
  // const JobPostView({Key? key}) : super(key: key);

  @override
  State<JobPostView> createState() => _JobPostViewState();
}

class _JobPostViewState extends State<JobPostView> {

  var selectedDept;
  var selectedJobTpe;
  var selectedJobLocation;

  late  QuillController quillController;


  @override
  Widget build(BuildContext context) {


    UserPostController controller =  Get.put(UserPostController());

    MypostController _mypostController =  Get.put(MypostController());


    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;


    quillController.document.changes.listen((event) {
      var jsonDelta = quillController.document.toDelta().toJson();
      var deltaHtml = DeltaToHTML.encodeJson(jsonDelta);
      var htmlToString = deltaHtml.toString();

      controller.jobDescription.value = htmlToString;

      print("texxxxxxxxxxxxx......."+controller.jobDescription.value .toString());
    });





    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeigth * 0.015,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getFieldTitle("Create a job",screenHeigth)
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
                      decoration: InputDecoration(
                        hintText: "Enter job title",
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
                      decoration: InputDecoration(
                        hintText: "Enter company name",
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
                  child:
                  DropdownSearch<Department?>(
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      hintStyle:
                      const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      hintText: "Select Department",

                    ),
                    items: controller.jobPostDept,
                    itemAsString: (Department? type) =>
                        type!.departmentName.toString(),
                    onChanged: (data ){
                      controller.jobDept.value = data!.id.toString();
                      print("...............data"+controller.jobDept.value.toString());
                    },
                    //show selected item
                  )
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
                          child:
                          Center(
                            child: Padding(
                              padding:  EdgeInsets.only(
                                left: screenWidth * 0.030,
                                // bottom: screenWidth * 0.040
                              ),
                              child: DropdownSearch<JobType?>(
                                mode: Mode.MENU,
                                dropdownSearchDecoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey,overflow: TextOverflow.ellipsis),
                                  border: InputBorder.none,

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
                          )
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
                          child:
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              // underline: SizedBox(),
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down,
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
                        getFieldTitle(controller.application_deadline.value.toString(), screenHeigth),
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
                  height: screenHeigth * .020,
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

                Obx(() => GestureDetector(
                  onTap: () async {
                    controller.getImage("job");
                    controller.showJobImageName.value = "";
                    controller.jobImageName();

                  },
                  child: Container(
                    height: screenHeigth * 0.080,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      color: Color(0xff27AE60),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.selectedJobImagePath.value == "" ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getAttachImageTitle('Upload Company Logo', screenHeigth),
                        getAttachImageTypeTitle( '(.jpg .jpeg .png .gif only)', screenHeigth)
                      ],
                    ) : Center(
                      child:   getAttachImageTypeTitle(controller.showJobImageName.value.toString(), screenHeigth)
                    ),
                  ),
                )),
                SizedBox(
                  height: screenHeigth * 0.020,
                ),

                ToggleSwitch(
                  cornerRadius: 10,
                  minWidth: screenWidth * 0.400,
                  minHeight: screenHeigth * 0.070,
                  fontSize: screenHeigth * 0.018,
                  initialLabelIndex: 1,
                  activeBgColor: [
                    Color(
                      0xff00602B,
                    )
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color(0xff0FA958),
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['Draft', 'Post'],
                  onToggle: (index) async {
                    print('switched to: $index');
                    if (index == 1) {
                    if (controller.jobTitle.value == '' &&
                        controller.companyName.value == '' &&
                        controller.jobType.value == '' &&
                        controller.jobDescription.value == '' &&
                        controller.jobDept.value == '' &&
                        controller.jobLocation.value == '' &&
                        controller.application_deadline == 'Select application deadline' &&
                        controller.jobLink.value == '') {
                      Get.snackbar(
                        "Error",
                        "Fill up all the require field",
                        colorText: Colors.white,
                        backgroundColor:Colors.orangeAccent,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (controller.jobTitle.value  == '' ||
                        controller.companyName.value == '' ||
                        controller.jobType.value == '' ||
                        controller.jobDescription.value == '' ||
                       controller.jobDept.value == '' ||
                       controller.jobLocation.value == '' ||
                       controller.application_deadline == 'Select application deadline' ||
                        controller.jobLink.value == '') {
                      Get.snackbar(
                        "Error",
                        "Fill up all the require field",
                        colorText: Colors.white,
                        backgroundColor:Colors.orangeAccent,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      await controller.uploadUserJobPost();
                      await _mypostController.fetchUserAllPost();
                      await _mypostController.fetchUserJobPost();
                    }

                    }
                    else {
                      if(controller.jobTitle.value == '' &&
                          controller.companyName.value == '' &&
                          controller.jobType.value == '' &&
                          controller.jobDescription.value == '' &&
                          controller.jobDept.value == '' &&
                          controller.jobLocation.value == '' &&
                          controller.application_deadline == 'Select application deadline'){
                        Get.snackbar(
                          "Error",
                          "Fill up all the field",
                          colorText: Colors.white,
                          backgroundColor:Colors.orangeAccent,
                          snackPosition: SnackPosition.BOTTOM,

                        );
                      }
                      else if (
                          controller.jobTitle.value  == '' ||
                          controller.companyName.value == '' ||
                          controller.jobType.value == '' ||
                          controller.jobDescription.value == '' ||
                          controller.jobDept.value == '' ||
                          controller.jobLocation.value == '' ||
                          controller.application_deadline == 'Select application deadline'
                      ){
                        Get.snackbar(
                          "Error",
                          "Fill up all the field",
                          colorText: Colors.white,
                          backgroundColor:Colors.orangeAccent,
                          snackPosition: SnackPosition.BOTTOM,

                        );
                      }
                      else {
                        await controller.draftUserJobPost();
                      }
                    }
                  },
                ),
                SizedBox(
                  height: screenHeigth * 0.020,
                ),

              ],
            ),
          ),
          Obx(() => controller.isProcessing.value == true ?
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenHeigth * 0.15
              ),
              child: Container(
                height: screenHeigth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: screenHeigth * 0.080
                    ),
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
                  ),
                ),
              ),
            ),
          ) : Visibility(
              visible: false,
              child: Container()))
        ],
      ),
    );
  }

  @override
  void initState() {
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
