import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base/views/base_view.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends StatefulWidget {
  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    UserProfileController controller = Get.put(UserProfileController());

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff0FA958),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Color(0xff777777),
                ),
              ),
              onPressed: () {
                // Get.back();
                Get.to(() => BaseView());
                print('clicked');
              }),
          appBar: AppBar(
            elevation: 0.0,
            // backgroundColor: Color(0xff0FA958),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                print("Clicked");
                Get.to(() => BaseView());
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Profile",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: screenheight * 0.017,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // backgroundColor: Color(0xff0FA958),
          body: Padding(
            padding: EdgeInsets.only(
              top: 2,
              left: 8,
              right: 8,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenheight * 0.020, right: screenheight * 0.020),
                  child: Divider(
                    height: 2.0,
                    color: titleTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE5E5E5),
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 5  horizontally
                            0.0, // Move to bottom 5 Vertically
                          ),
                        ),
                      ],
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rakibul Islam Khan",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff777777),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Managing Director",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff777777),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Pakiza Technovation Ltd.",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "Upload CV",
                                              style: TextStyle(
                                                color: Color(0xff777777),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Export CV as",
                                          style: TextStyle(
                                            color: Color(0xff777777),
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.picture_as_pdf),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          profileItems_Bio(
                            icon: Icons.person,
                            screenWidth: screenWidth,
                            longText: controller.bioInfoText.toString(),
                            title: "Bio",
                          ),
                          profileItems_Contact_info(
                            screenWidth: screenWidth,
                            title: "Contact & Social Information",
                            icon: Icons.contact_phone,
                          ),
                          profileItems_Professional_info(
                            screenWidth: screenWidth,
                            longText:
                                controller.professionalInfoText.toString(),
                            title: "Professional Info",
                            icon: Icons.shopping_bag_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class profileItems_Bio extends StatefulWidget {
  profileItems_Bio({
    Key? key,
    required this.screenWidth,
    required this.longText,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  late String longText;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Bio> createState() => _profileItems_BioState();
}

class _profileItems_BioState extends State<profileItems_Bio> {
  UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 6,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff777777),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showBioDialog(context);
                          },
                          child: Icon(
                            Icons.edit_note,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Text(
                        controller.bioInfoText.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showBioDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),

          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Text(
              'Enter your bio',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontSize: widget.screenWidth * 0.035),
            ),
          ),
          //EN: Logging out
          content: Padding(
            padding: EdgeInsets.only(right: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffC4C4C4), width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: controller.bioInfoText.toString(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                  onChanged: (val) {
                    controller.bioInfoText.value = val.toString();
                    setState(() {
                      widget.longText = val.toString();
                    });
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class profileItems_Contact_info extends StatefulWidget {
  profileItems_Contact_info({
    Key? key,
    required this.screenWidth,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Contact_info> createState() =>
      _profileItems_Contact_infoState();
}

class _profileItems_Contact_infoState extends State<profileItems_Contact_info> {
  UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 6,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff777777),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showContactDialog(context);
                          },
                          child: Icon(
                            Icons.edit_note,
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Column(
                          children: [
                            Row(
                              children: [
                                Text("Phone No :",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    controller.phoneNo.toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Personal Email :",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    controller.personalEmail.toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Official Email :",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    controller.officialEmail.toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Facebook :",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      controller.facebook.toString(),
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Linkedin :",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      controller.linkedin.toString(),
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff777777),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Twitter :",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    )),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      controller.twitter.toString(),
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showContactDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),
          titleTextStyle: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16.0,
          ),
          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enter your contact & social info:',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: widget.screenWidth * 0.035),
                  overflow: TextOverflow.ellipsis,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 28,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  tooltip: "close",
                )
              ],
            ),
          ),
          //EN: Logging out
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.phoneNo.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter phone no.',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            )),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.phoneNo.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.personalEmail.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter personal mail.',
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            )),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.personalEmail.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.officialEmail.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter official mail.',
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Colors.grey,
                            )),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.officialEmail.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.facebook.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter facebook id.',
                            prefixIcon: Icon(
                              Icons.facebook,
                              color: Colors.grey,
                            )),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.facebook.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.linkedin.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter linkedin id',
                            prefixIcon: Icon(
                              CupertinoIcons.link_circle,
                              color: Colors.grey,
                            )),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.linkedin.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.twitter.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Twitter id',
                            prefixIcon: Icon(
                              Icons.link,
                              color: Colors.grey,
                            )),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.twitter.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class profileItems_Professional_info extends StatefulWidget {
  profileItems_Professional_info({
    Key? key,
    required this.screenWidth,
    required this.longText,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  late String longText;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Professional_info> createState() =>
      _profileItems_Professional_infoState();
}

class _profileItems_Professional_infoState
    extends State<profileItems_Professional_info> {
  UserProfileController controller = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 6,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff777777),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showProfessionalDialog(
                                context, screenHeigth, screenWidth);
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.count.value,
                        itemBuilder: (_, index){
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text("Company :",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        controller.company.toString(),
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showProfessionalDialog(
                                          context, screenHeigth, screenWidth);
                                    },
                                    child: Icon(Icons.edit_note),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Address :",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        controller.linkedin.toString(),
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff777777),
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Designation :",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        controller.twitter.toString(),
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("year :",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                        ),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        controller.facebook.toString(),
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showProfessionalDialog(
      BuildContext context, double screenHeigth, double screenWidth) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),

          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Text(
              'Enter your Professional Info',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontSize: widget.screenWidth * 0.035),
            ),
          ),
          //EN: Logging out
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Company',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.company.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.company.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.address.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.address.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Designation',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.designation.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val) {
                          controller.designation.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Text(
                            'Joining Date',
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                        Container(
                            height: screenHeigth * 0.070,
                            width: screenWidth * 0.350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xffC4C4C4), width: 2),
                            ),
                            child: Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // controller.chooseApplicationDeadLine();
                                      },
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spacer(),
                                    Text('20,0202002020' +
                                        controller.year.toString())
                                  ],
                                ))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Text(
                            'End Date',
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                        Container(
                            height: screenHeigth * 0.070,
                            width: screenWidth * 0.350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xffC4C4C4), width: 2),
                            ),
                            child: Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // controller.chooseApplicationDeadLine();
                                      },
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spacer(),
                                    Text('20,0202002020' +
                                        controller.year.toString())
                                  ],
                                ))),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [],
                )
              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                controller.count.value++;
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.longText = "";
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
