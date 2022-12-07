import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/register_controller.dart';

class PageThree extends StatelessWidget {
  // const PageThree({Key? key}) : super(key: key);

  final RegisterController regController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenHeigth * 0.045,
              top: screenHeigth * 0.010
            ),
            child: Text(
              'Address :',
              style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: screenHeigth * 0.017,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          Obx(() =>   GestureDetector(
            onTap: () async {
              await regController.getImage(screenHeigth);
            },
            child: Container(
              height: screenHeigth * 0.15,
              width: screenHeigth * 0.15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: regController.selectedImagePath.value == "" ?
                      AssetImage('assets/images/user.png') :
                      FileImage(regController.imageFile!) as ImageProvider
                  )
              ),
            ),
          )),
          SizedBox(
            height: screenHeigth * 0.020,
          ),
          page_three_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            "Present address-(area/House-? Road-) village,PO,Police station/Upazila,District,Country)",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          page_three_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 30,
            ),
            "Permanent address-(area/House-? Road-) village,PO,Police station/Upazila,District,Country)",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.020,
          ),
          page_three_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.password,
              color: Colors.white,
              size: 30,
            ),
            "Password",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          page_three_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.password_outlined,
              color: Colors.white,
              size: 30,
            ),
            "Confirm Password",
            1
          ),




        ],
      ),
    );
  }
}

page_three_textfield(
    double screenHeigth, double screenWidth, Widget icon, String hinttxt,int isImportant) {
  final RegisterController regController = Get.put(RegisterController());
  return Obx(() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          color: isImportant == 1 ? Colors.red : Color(0xff00602B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        height: screenHeigth * 0.060,
        width: screenWidth * 0.170,
        child: icon,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.all(
            width: 1,
            color: isImportant == 1 ? Colors.red : Color(0xff00602B),
          ),
        ),
        height: screenHeigth * 0.060,
        width: screenWidth * 0.70,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: TextField(
                obscureText: hinttxt == "Password" ? regController.isVisible == true ? false : true :
                hinttxt == "Confirm Password" ? regController.isVisible2 == true ? false : true : false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hinttxt,
                    suffixIcon: IconButton(onPressed: () {

                      if(hinttxt == "Password"){
                        regController.isVisible.value == true ?
                        regController.isVisible.value = false : regController.isVisible.value = true;
                      }
                      if(hinttxt == "Confirm Password") {
                        regController.isVisible2.value == true ?
                        regController.isVisible2.value = false : regController.isVisible2.value = true;
                      }


                    },

                      icon: hinttxt == "Password" ?
                      regController.isVisible == true ? Icon(Icons.visibility, color: Colors.black,) :
                      Icon(Icons.visibility_off, color: Colors.grey,) :
                      hinttxt == "Confirm Password" ? regController.isVisible2 == true ? Icon(Icons.visibility, color: Colors.black,) :
                      Icon(Icons.visibility_off, color: Colors.grey,) :
                      Visibility(
                        visible: false,
                        child: Icon(
                            Icons.label
                        ),
                      ),

                    )
                ),
                onChanged: (value){
                  hinttxt == "Present address-(area/House-? Road-) village,PO,Police station/Upazila,District,Country)" ?
                  regController.presentAddress.value = value.toString() :
                  hinttxt == "Permanent address-(area/House-? Road-) village,PO,Police station/Upazila,District,Country)" ?
                  regController.permanentAddress.value = value.toString() :
                  hinttxt == "Password" ?
                  regController.password.value = value.toString() :
                  regController.confirmPassword.value = value.toString();
                }),
          ),
        ),
      ),
      Visibility(
          visible: false,
          child: Text(regController.isVisible.value.toString()))
    ],
  ));
}
