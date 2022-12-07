

import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTitleText(String titleName,double fontSize){
  return Text(
    titleName,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      color: titleTextColor,
      fontWeight: FontWeight.w400
    ),
  );
}