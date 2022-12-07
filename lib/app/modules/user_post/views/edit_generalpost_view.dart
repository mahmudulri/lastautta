import 'dart:convert';

import 'package:delta_to_html/delta_to_html.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../utill/app_colors.dart';
import '../../../widget/custom_feild_title.dart';
import '../controllers/mypost_controller.dart';
import '../controllers/update_post_controller.dart';
import '../controllers/user_post_controller.dart';
import '../model/chip_model.dart';
import '../model/post_type_model.dart';

class EditGeneralPostView extends StatefulWidget {

  var index = Get.arguments;



  @override
  State<EditGeneralPostView> createState() => _GeneralPostViewState();
}

class _GeneralPostViewState extends State<EditGeneralPostView> {

  var selectedItem;

  UpdatePostController controller =  Get.put(UpdatePostController());


  late  QuillController quillController;



  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    controller.fetchUserAllPost();
    // controller.updateFeild(widget.index);



    // controller.json = controller.allPost.value.userAllPosts![0].userPost![widget.index].postDescription.toString();

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: getFieldTitle('General post', screenHeight),
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Divider(
                height: 2.0,
                color: titleTextColor,
              ),
              Obx(() {
                return controller.isAllPostLoading.value == true ? Align(
                  alignment: Alignment.center,
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
                ) :
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getFieldTitle("Update your post", screenHeight),
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
                        Obx(() {
                          controller.postType.value =
                              controller.allPost.value.userAllPosts![0]
                                  .userPost![widget.index].postType.toString();
                          return
                          //   DropdownButton<String>(
                          //   isExpanded: true,
                          //   icon: Icon(
                          //     Icons.arrow_drop_down,
                          //   ),
                          //   hint: getPlainText(
                          //       controller.allPost.value.userAllPosts![0]
                          //           .userPost![widget.index].postType
                          //           .toString()),
                          //   onChanged: (val) {
                          //     controller.postType.value = val.toString();
                          //     setState(() => selectedItem = val.toString());
                          //     print(controller.postType.value.toString());
                          //   },
                          //   value: this.selectedItem,
                          //   items:
                          //   controller.dropDownPostItem.map((quantityValue) {
                          //     return DropdownMenuItem(
                          //         value: quantityValue,
                          //         child: Padding(
                          //           padding: EdgeInsets.only(
                          //               left: screenHeight * 0.019
                          //           ),
                          //           child: getDropdownTitle(quantityValue),
                          //         ));
                          //   }).toList(),
                          // );
                            DropdownSearch<PostTypeElement?>(
                              mode: Mode.MENU,
                              dropdownSearchDecoration: InputDecoration(
                                hintStyle:
                                const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                hintText: controller.allPost.value.userAllPosts![0]
                                          .userPost![widget.index].postType
                                          .toString()
                              ),
                              items: controller.postTypeList,
                              itemAsString: (PostTypeElement? type) =>
                                  type!.typeName.toString(),
                              onChanged: (data ){
                                controller.postType.value = data!.id.toString();
                                print("...............data"+controller.postType.value.toString());
                              },
                              //show selected item
                            );
                        }
                        )
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
                          controller: TextEditingController(
                              text: controller.allPost.value.userAllPosts![0]
                                  .userPost![widget.index].postTitle.toString()
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          minLines: 1,
                          maxLines: 3,
                          onChanged: (value) {
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
                            child: QuillToolbar.basic(
                                controller: quillController),
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
                                  padding: EdgeInsets.all(10),
                                  focusNode: FocusNode(),),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),


                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Obx(() {
                      controller.selectedImagePath.value = controller.allPost
                          .value.userAllPosts![0].userPost![widget.index].image
                          .toString();
                      return GestureDetector(
                        onTap: () async {
                          await controller.getImage("global");
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
                                  getAttachImageTitle(
                                      'Attach Image / Upload Image',
                                      screenHeight),
                                  getAttachImageTypeTitle(
                                      '(.jpg .jpeg .png .gif only)',
                                      screenHeight)
                                ],
                              ) : Center(
                                child: getAttachImageTypeTitle(
                                    controller.showImageName.value.toString(),
                                    screenHeight),
                              )
                          ),
                        ),
                      );
                    }
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
                          onFieldSubmitted: (value) {
                            if (value != "") {
                              controller.chipList.add(
                                  ChipModel(DateTime.now().toString(),
                                      value.toString())
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
                    Obx(() {
                      if (controller.allPost.value.userAllPosts![0]!
                          .userPost![widget.index].tag != null && controller
                          .allPost.value.userAllPosts![0]!.userPost![widget
                          .index].tag != "") {
                        List<String> tag = controller.allPost.value
                            .userAllPosts![0]!.userPost![widget.index].tag
                            .toString().split(',');
                        print("..............." + tag.toString());
                      }
                      return Wrap(
                        spacing: 4.0,
                        children: controller.chipList.map((chip) =>
                            Chip(
                                backgroundColor: titleTextColor,
                                onDeleted: () {
                                  controller.chipList.removeWhere((
                                      element) => element.id == chip.id);
                                },
                                label:
                                getChipTitle(
                                    chip.title.toString(), screenHeight)
                            )).toList(),
                      );
                    }
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    SizedBox(
                        height: screenHeight * 0.070,
                        width: screenWidth * 0.78,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Color(0xff00602B),
                          ),
                          onPressed: () {},
                          child: getButtonTitle('Share'),
                        )
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                  ],
                );
              }
                ),
              Obx(() => controller.isLoading.value == true ?
              Align(
                alignment: Alignment.center,
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

    // var json = jsonEncode(
    //   controller.json
    // );
    //
    // var json2 = jsonDecode(json) as List<dynamic>;
    // final doc = Document.fromJson(json2 );

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