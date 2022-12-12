import 'package:aust_textile_alumni/app/modules/user_post/model/post_type_model.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:aust_textile_alumni/app/widget/custom_feild_title.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../user_post/controllers/mypost_controller.dart';
import '../../user_post/controllers/user_post_controller.dart';

class UploadVideo extends StatelessWidget {
  UploadVideo({super.key});

  UserPostController controller = Get.put(UserPostController());
  MypostController _mypostController = Get.put(MypostController());

  @override
  Widget build(BuildContext context) {
    var screenHeigth = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Icon(
            Icons.arrow_back,
            size: screenWidth * 0.070,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Upload Video",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: screenHeigth * 0.017,
              color: Color(0xff0FA958),
            ),
          ),
        ),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Color(0xff00602B),
              height: 1.0,
            ),
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // catergory sectiion.................................////

              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getFieldTitle("Category *", screenHeigth),
                ],
              ),
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffC4C4C4), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: screenHeigth * 0.070,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: DropdownSearch<PostTypeElement?>(
                    dropdownSearchDecoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintText: "Select Category",
                    ),
                    items: controller.postTypeList,
                    itemAsString: (PostTypeElement? type) =>
                        type!.typeName.toString(),
                    onChanged: (data) {
                      print("...............data" +
                          controller.postType.value.toString());
                    },
                    //show selected item
                  ),
                ),
              ),

              // title section .........................
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getFieldTitle("Video title *", screenHeigth),
                ],
              ),
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffC4C4C4), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Video title",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 3,
                    onChanged: (value) {
                      value.toString();
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
                  getFieldTitle("Video Description *", screenHeigth),
                ],
              ),
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffC4C4C4), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 7,
                    onChanged: (value) {
                      value.toString();
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
                  Text(
                    "Video Link (only youtube link) *",
                    style: GoogleFonts.poppins(
                      fontSize: screenHeigth * 0.017,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffC4C4C4), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "https://www.youtube.com.....",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 3,
                    onChanged: (value) {
                      value.toString();
                    },
                  ),
                ),
              ),

              SizedBox(
                height: screenHeigth * 0.020,
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: screenHeigth * 0.070,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff00602B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {},
                          child: getButtonTitle('Upload'),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
