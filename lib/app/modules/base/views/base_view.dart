

import 'package:aust_textile_alumni/app/modules/alumni_book/views/alumni_book_view.dart';
import 'package:aust_textile_alumni/app/modules/home/views/home_view.dart';
import 'package:aust_textile_alumni/app/modules/message/views/message_view.dart';
import 'package:aust_textile_alumni/app/modules/user_post/views/user_post_view.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:aust_textile_alumni/app/widget/job_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../job/views/job_view.dart';
import '../../user_profile/views/user_profile_view.dart';
import '../controllers/base_controller.dart';


class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 2;

  final screens = [
    AlumniBookView(),
    JobView(),
    HomeView(),
    MessageView(),
    UserProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            currentIndex: currentIndex,
            selectedItemColor: titleTextColor,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() => currentIndex = index);
              print("inddddddddddddddex" + currentIndex.toString());
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.auto_stories_outlined,
                  ),
                  label: 'Alumni book'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.school_outlined,
                  ),
                  label: 'Job'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore_outlined,
                  ),
                  label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message_outlined,
                  ),
                  label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                  ),
                  label: 'Account'),
            ],
          ),
          body: screens[currentIndex],
        ),
    ),
      );
  }
}
