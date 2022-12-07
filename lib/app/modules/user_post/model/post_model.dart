
import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.postTitle,
    this.postType,
    this.postDescription,
    this.image,
    this.postedBy,
    this.date,
    this.isPublished,
    this.tag,
  });

  PostModel.withID({
    this.id,
    this.postTitle,
    this.postType,
    this.postDescription,
    this.image,
    this.postedBy,
    this.date,
    this.isPublished,
    this.tag,
  });

  int? id;
  String? postTitle;
  String? postType;
  String? postDescription;
  String? image;
  String? postedBy;
  String? date;
  String? isPublished;
  String? tag;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel.withID(
    id: json["id"],
    postTitle: json["postTitle"],
    postType: json["postType"],
    postDescription: json["postDescription"],
    image: json["image"],
    postedBy: json["postedBy"],
    date: json["date"],
    isPublished: json["isPublished"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "postTitle": postTitle,
    "postType": postType,
    "postDescription": postDescription,
    "image": image,
    "postedBy": postedBy,
    "date": date,
    "isPublished": isPublished,
    "tag": tag,
  };
}
