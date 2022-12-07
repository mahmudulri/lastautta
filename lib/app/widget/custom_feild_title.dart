import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getFieldTitle(String title,double screenHeigth){
  return Text(
    title,
    style: GoogleFonts.poppins(
      fontSize: screenHeigth * 0.017,
      color: Color(0xff00602B),
    ),
  );
}


Widget getChipTitle(String title,double screenHeigth){
  return Text(
    title,
    style: GoogleFonts.poppins(
      fontSize: screenHeigth * 0.017,
      color: Colors.white,
    ),
  );
}

Widget getButtonTitle(String buttonName ){
  return Text(
    buttonName,
    style: GoogleFonts.poppins(
      fontSize: 17,
    ),
  );
}

Widget getDropdownTitle(String dropdownValue){
  return Text(
    dropdownValue,
    style: GoogleFonts.poppins(
        fontSize: 15.0),
  );

}

Widget getLoadingTitle(){
  return Text("Please wait ....",style: GoogleFonts.poppins(
      color: Colors.grey
  ),);
}

Widget getPlainText(String title){
  return Text(title);
}

Widget getAttachImageTitle(String title,double screenHeigth){
  return  Text(
    title,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: screenHeigth * 0.020,
        color: Color(0xffFFFFFF)),
  );
}

Widget getAttachImageTypeTitle(String title,double screenHeigth){
  return Text(
    title,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: screenHeigth * 0.015,
        color: Color(0xffFFFFFF)),
  );
}