import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/register_controller.dart';
import '../../model/company_model.dart';
import '../../model/job_sector_model.dart';
import '../../model/job_sub_sector_model.dart';

class PageTwo extends StatelessWidget {
  // const PageTwo({Key? key}) : super(key: key);



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
            ),
            child: Text(
              'Professional Info :',
              style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: screenHeigth * 0.017,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(
            height: screenHeigth * 0.020,
          ),
          jobSectorDropDown(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.work_history_rounded,
              color: Colors.white,
              size: 30,
            ),
            "Job Sector",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          jobSubSectorDropDown(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.work,
              color: Colors.white,
              size: 30,
            ),
            "Job Sub Sector",
            0
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          page_two_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.email,
              color: Colors.white,
              size: 30,
            ),
            "Email",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          page_two_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.mail_lock_sharp,
              color: Colors.white,
              size: 30,
            ),
            "Official Email",
            0
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          page_two_textfield(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.location_city_outlined,
              color: Colors.white,
              size: 30,
            ),
            "Office address(area/ village,PO,Police station/ Upazila, District,Country)",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
          companyDropDown(
            screenHeigth,
            screenWidth,
            Icon(
              Icons.factory,
              color: Colors.white,
              size: 30,
            ),
            "Name of the Company",
            1
          ),
          SizedBox(
            height: screenHeigth * 0.010,
          ),
        ],
      ),
    );
  }
}

page_two_textfield(
    double screenHeigth, double screenWidth, Widget icon, String hinttxt,int isImportant) {

  final RegisterController regController = Get.put(RegisterController());

  return Row(
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hinttxt,
                ),
                onChanged: (value){
                  hinttxt == "Job Sector" ?
                  regController.jobSector.value = value.toString() :
                  hinttxt == "Job Sub Sector" ?
                  regController.jobSubSector.value = value.toString() :
                  hinttxt == "Email" ?
                  regController.email.value = value.toString() :
                  hinttxt == "Official Email" ?
                  regController.officialEmail.value = value.toString() :
                  hinttxt == "Office address(area/ village,PO,Police station/ Upazila, District,Country)" ?
                  regController.officeAddress.value = value.toString() :
                  regController.companyName.value = value.toString();
                }
            ),
          ),
        ),
      ),
    ],
  );
}

Widget jobSectorDropDown( double screenHeigth, double screenWidth, Widget icon,String hinttxt,int isImportant){

  final RegisterController regController = Get.put(RegisterController());

  return Row(
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
        child:
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.045
          ),
          child: DropdownSearch<JobSectorElement?>(
            mode: Mode.MENU,
            dropdownSearchDecoration: InputDecoration(
              hintStyle:
              const TextStyle(color: Colors.grey),
              border: InputBorder.none,
              hintText: hinttxt,

            ),
            items: regController.jobSectorList,
            itemAsString: (JobSectorElement? type) =>
                type!.jobSectorName.toString(),
            onChanged: (data ){
              regController.jobSector.value = data!.id.toString();
              regController.jobSectorId.value = data!.id.toString();
              regController.fetchJobSubSector();
              print("...............data"+regController.jobSector.value.toString());
            },
            //show selected item
          ),
        )
      ),
    ],
  );

}

Widget jobSubSectorDropDown( double screenHeigth, double screenWidth, Widget icon,String hinttxt,int isImportant){

  final RegisterController regController = Get.put(RegisterController());

  return Row(
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
          child:
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.045
            ),
            child: DropdownSearch<JobSubSectorElement?>(
              mode: Mode.MENU,
              dropdownSearchDecoration: InputDecoration(
                hintStyle:
                const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                hintText: hinttxt,

              ),
              items: regController.jobSubSectorList,
              itemAsString: (JobSubSectorElement? type) =>
                  type!.jobSubSectorName.toString(),
              onChanged: (data ){
                regController.jobSubSector.value = data!.id.toString();
                print("...............data1111"+regController.jobSubSector.value.toString());
              },
              //show selected item
            ),
          )
      ),
    ],
  );

}


Widget companyDropDown( double screenHeigth, double screenWidth, Widget icon,String hinttxt,int isImportant){

  final RegisterController regController = Get.put(RegisterController());

  return Row(
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
          child:
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.045
            ),
            child: DropdownSearch<CompanyName?>(
              mode: Mode.MENU,
              dropdownSearchDecoration: InputDecoration(
                hintStyle:
                const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                hintText: hinttxt,

              ),
              items: regController.companyNameList,
              itemAsString: (CompanyName? type) =>
                  type!.companyName.toString(),
              onChanged: (data ){
                data!.id == 0 ? regController.companyName.value = data!.companyName.toString() :
                regController.companyName.value = data!.id.toString();
                print("...............data"+regController.companyName.value.toString());
              },
              //show selected item
            ),
          )
      ),
    ],
  );

}