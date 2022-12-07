import 'dart:convert';

import 'package:aust_textile_alumni/app/modules/user_post/model/post_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_post_controller.dart';

class TestView extends GetView {

  UserPostController controller =  Get.put(UserPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.draftPost.value.length.toString()),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: controller.draftPost.length,
          itemBuilder: (context,index){
            return Obx(() =>  Container(
              height: 200,
              margin: EdgeInsets.only(
                  bottom: 15.0
              ),
              color: Colors.green,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.memory(base64Decode(controller.draftPost![index].image.toString())),
                  ),

                  GestureDetector(
                    onTap: () async {
                      PostModel post = controller.draftPost[index];
                      post.postTitle = 'future title';
                      controller.updateDraftPost(post);
                      // if(post.id != null){
                      //   String i = post.id.toString();
                      //   await controller.deleteDraftPost(int.parse(i));
                      // }

                    },
                    child: Text(controller.draftPost![index].postTitle.toString(),
                      style: TextStyle(
                          fontSize: 40
                      ),),
                  )
                ],
              )
              ,
            ))
             ;
          }),
    );
  }
}
