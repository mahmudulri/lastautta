// To parse this JSON data, do
//
//     final userGlobalPost = userGlobalPostFromJson(jsonString);

import 'dart:convert';

UserGlobalPost userGlobalPostFromJson(String str) => UserGlobalPost.fromJson(json.decode(str));

String userGlobalPostToJson(UserGlobalPost data) => json.encode(data.toJson());

class UserGlobalPost {
  UserGlobalPost({
    this.status,
    this.generalPosts,
  });

  int? status;
  List<GeneralPost>? generalPosts;

  factory UserGlobalPost.fromJson(Map<String, dynamic> json) => UserGlobalPost(
    status: json["status"],
    generalPosts: List<GeneralPost>.from(json["general_posts"].map((x) => GeneralPost.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "general_posts": List<dynamic>.from(generalPosts!.map((x) => x.toJson())),
  };
}

// class GeneralPost {
//   GeneralPost({
//     this.postTitle,
//     this.postType,
//     this.postDescription,
//     this.image,
//     this.postedBy,
//     this.date,
//     this.isPublished,
//     this.isArchived,
//     this.tag,
//     this.createdAt,
//
//   });
//
//   String? postTitle;
//   String? postType;
//   String? postDescription;
//   String? image;
//   String? postedBy;
//   String? date;
//   int? isPublished;
//   int? isArchived;
//   dynamic? tag;
//   String? createdAt;
//
//
//
//   factory GeneralPost.fromJson(Map<String, dynamic> json) => GeneralPost(
//     postTitle: json["post_title"],
//     postType: json["post_type"],
//     postDescription: json["post_description"],
//     image: json["image"],
//     postedBy: json["posted_by"],
//     date: json["date"],
//     isPublished: json["isPublished"],
//     isArchived: json["isArchived"],
//     tag: json["tag"],
//     createdAt: json["created_at"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "post_title": postTitle,
//     "post_type": postType,
//     "post_description": postDescription,
//     "image": image,
//     "posted_by": postedBy,
//     "date": date,
//     "isPublished": isPublished,
//     "isArchived": isArchived,
//     "tag": tag,
//     "created_at": createdAt,
//
//   };
// }

class GeneralPost {
  GeneralPost({
    this.id,
    this.postTitle,
    this.postType,
    this.postDescription,
    this.image,
    this.postedBy,
    this.updatedBy,
    this.date,
    this.isArchived,
    this.isPublished,
    this.tag,
    this.createdAt,
  });

  int? id;
  String? postTitle;
  String? postType;
  String? postDescription;
  String? image;
  String? postedBy;
  dynamic updatedBy;
  String? date;
  int? isArchived;
  String? isPublished;
  String? tag;
  String? createdAt;


  factory GeneralPost.fromJson(Map<String, dynamic> json) => GeneralPost(
    id: json["id"],
    postTitle: json["post_title"],
    postType: json["post_type"],
    postDescription: json["post_description"],
    image: json["image"],
    postedBy: json["posted_by"],
    updatedBy: json["updated_by"],
    date: json["date"],
    isArchived: json["isArchived"],
    isPublished: json["isPublished"],
    tag: json["tag"],
    createdAt: json["created_at"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_title": postTitle,
    "post_type": postType,
    "post_description": postDescription,
    "image": image,
    "posted_by": postedBy,
    "updated_by": updatedBy,
    "date": date,
    "isArchived": isArchived,
    "isPublished": isPublished,
    "tag": tag,
    "created_at": createdAt,
  };
}