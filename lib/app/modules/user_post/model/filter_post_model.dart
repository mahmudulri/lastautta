
import 'dart:convert';

FilterPost filterPostFromJson(String str) => FilterPost.fromJson(json.decode(str));

String filterPostToJson(FilterPost data) => json.encode(data.toJson());

class FilterPost {
  FilterPost({
    this.status,
    this.filterDatePosts,
  });

  int? status;
  List<FilterDatePost>? filterDatePosts;

  factory FilterPost.fromJson(Map<String, dynamic> json) => FilterPost(
    status: json["status"],
    filterDatePosts: List<FilterDatePost>.from(json["filterDatePosts"].map((x) => FilterDatePost.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "filterDatePosts": List<dynamic>.from(filterDatePosts!.map((x) => x.toJson())),
  };
}
//
// class FilterDatePost {
//   FilterDatePost({
//     this.id,
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
//   int? id;
//   String? postTitle;
//   String? postType;
//   String? postDescription;
//   String? image;
//   String? postedBy;
//   String? date;
//   int? isPublished;
//   int? isArchived;
//   String? tag;
//   String? createdAt;
//
//
//   factory FilterDatePost.fromJson(Map<String, dynamic> json) => FilterDatePost(
//     id: json["id"],
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
//     "id": id,
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

// To parse this JSON data, do
//
//     final filterDatePost = filterDatePostFromJson(jsonString);



class FilterDatePost {
  FilterDatePost({
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

  factory FilterDatePost.fromJson(Map<String, dynamic> json) => FilterDatePost(
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

