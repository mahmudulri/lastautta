import 'package:aust_textile_alumni/app/modules/user_post/views/test_view.dart';
import 'package:delta_to_html/delta_to_html.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../routes/app_pages.dart';
import '../../../utill/app_colors.dart';
import '../../../widget/custom_feild_title.dart';
import '../controllers/mypost_controller.dart';
import '../controllers/user_post_controller.dart';
import '../model/chip_model.dart';
import '../model/post_type_model.dart';

class GeneralPostView extends StatefulWidget {
  @override
  State<GeneralPostView> createState() => _GeneralPostViewState();
}

class _GeneralPostViewState extends State<GeneralPostView> {

  var selectedItem;

  UserPostController controller =  Get.put(UserPostController());
  MypostController _mypostController =  Get.put(MypostController());

  late  QuillController quillController;


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    quillController.document.changes.listen((event) {
      var jsonDelta = quillController.document.toDelta().toJson();
      var deltaHtml = DeltaToHTML.encodeJson(jsonDelta);
      var htmlToString = deltaHtml.toString();

      controller.postDescription.value = htmlToString;

      print("texxxxxxxxxxxxx......."+controller.postDescription.value .toString());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //    Get.to(()=> TestView());
      // },
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Create your post", screenHeight),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Category", screenHeight),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      child:
                      DropdownSearch<PostTypeElement?>(
                        mode: Mode.MENU,
                        dropdownSearchDecoration: InputDecoration(
                          hintStyle:
                          const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          hintText: "Select Category",

                        ),
                        items: controller.postTypeList,
                          itemAsString: (PostTypeElement? type) =>
                          type!.typeName.toString(),
                        onChanged: (data ){
                           controller.postType.value = data!.id.toString();
                           print("...............data"+controller.postType.value.toString());
                        },
                        //show selected item
                      ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Post title", screenHeight),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.019,
                          right: screenHeight * 0.019
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: (value){
                          controller.postTitle.value = value.toString();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Your post", screenHeight),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenHeight * 0.010,
                              right: screenHeight * 0.010,
                              top: screenHeight * 0.025,
                              bottom: screenHeight * 0.025
                          ),
                          child: QuillToolbar.basic(controller: quillController),
                        ),
                        Divider(
                          thickness: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: screenHeight * 0.35,
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
                    height: screenHeight * 0.020,
                  ),
                   Obx(() =>
                      GestureDetector(
                        onTap: () async {
                          await controller.getImage("global");
                          controller.showImageName.value = "";
                          controller.postImageName();

                        },
                        child: Container(
                          height: screenHeight * 0.080,
                          width: screenWidth - 20,
                          decoration: BoxDecoration(
                            color: Color(0xff27AE60),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenHeight * 0.019,
                                  right: screenHeight * 0.019
                              ),
                              child: controller.selectedImagePath.value == "" ?
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      getAttachImageTitle('Attach Image / Upload Image', screenHeight),
                                      getAttachImageTypeTitle( '(.jpg .jpeg .png .gif only)', screenHeight)
                                    ],
                                  ) : Center(
                                child:  getAttachImageTypeTitle(controller.showImageName.value.toString(), screenHeight)
                                // getAttachImageTypeTitle(controller.selectedJobImagePath.value.toString().substring(78,96), screenHeight),
                              )
                          ),
                        ),
                      ),
                   ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFieldTitle("Tags", screenHeight),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.019,
                          right: screenHeight * 0.019
                      ),
                      child: TextFormField(
                        controller: controller.chipTextController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 30,
                        onFieldSubmitted: (value){
                          if(value != "" && value.contains(',')){
                            controller.chipList.add(
                                ChipModel(DateTime.now().toString(), value.toString())
                            );
                            controller.chipTextController.clear();
                          }

                        },

                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Obx(() => Wrap(
                    spacing: 4.0,
                    children:  controller.chipList.map((chip) => Chip(
                      backgroundColor: titleTextColor,
                      onDeleted: (){
                        controller.chipList.removeWhere((element) => element.id == chip.id);
                      },
                      label:
                      getChipTitle(chip.title.toString(), screenHeight)
                    )).toList(),
                  ),),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  ToggleSwitch(
                    cornerRadius: 10,
                    minWidth: screenWidth * 0.400,
                    minHeight: screenHeight * 0.070,
                    fontSize: screenHeight * 0.018,
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
                    labels: ['Draft', 'Share'],
                    onToggle: (index) async {
                      print('switched to: $index');
                      if(index == 1){
                        if(controller.postTitle.value == '' &&
                            controller.postType.value == '' &&
                            controller.postDescription.value == ''){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Colors.orangeAccent,
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else if(controller.postTitle.value == '' || controller.postType.value == '' ||
                            controller.postDescription.value == '' ){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Colors.orangeAccent,
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else{
                          await controller.uploadUserPost();
                          await _mypostController.fetchUserAllPost();
                          await _mypostController.fetchUserGlobalPost();
                        }


                      }
                      else {

                        if(controller.postTitle.value == '' &&
                            controller.postType.value == '' &&
                            controller.postDescription.value == '' &&
                               controller.base64Image.value == ''){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Colors.orangeAccent,
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else if (
                        controller.postTitle.value == '' || controller.postType.value == '' ||
                            controller.postDescription.value == '' ||
                             controller.base64Image.value == ''
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
                          await controller.draftUserPost();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                ],
              ),
              Obx(() => controller.isLoading.value == true ?
              Container(
                height: screenHeight,
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: screenHeight * 0.25,
                      width: screenHeight * 0.25,
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
              ) : Visibility(
                  visible: false,
                  child: Container()))
            ],

          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Document doc = Document();

    quillController = QuillController(
      document: doc, selection: TextSelection.collapsed(offset: 0),
    );
  }

  @override
  void dispose() {
    quillController.dispose();
  }
}


