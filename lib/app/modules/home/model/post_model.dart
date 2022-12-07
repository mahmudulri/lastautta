// To parse this JSON data, do
//
//     final allPost = allPostFromJson(jsonString);

// import 'dart:convert';
//
// AllPost allPostFromJson(String str) => AllPost.fromJson(json.decode(str));
//
// String allPostToJson(AllPost data) => json.encode(data.toJson());
//
// class AllPost {
//   AllPost({
//     this.status,
//     this.totalPosts,
//     this.totalActivePosts,
//     this.totalPendingPosts,
//     this.posts,
//   });
//
//   int? status;
//   int? totalPosts;
//   int? totalActivePosts;
//   int? totalPendingPosts;
//   List<Post>? posts;
//
//   factory AllPost.fromJson(Map<String, dynamic> json) => AllPost(
//     status: json["status"],
//     totalPosts: json["total_posts"],
//     totalActivePosts: json["total_active_posts"],
//     totalPendingPosts: json["total_pending_posts"],
//     posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "total_posts": totalPosts,
//     "total_active_posts": totalActivePosts,
//     "total_pending_posts": totalPendingPosts,
//     "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
//   };
// }
//
//
// class Post {
//   Post({
//     this.id,
//     this.postTitle,
//     this.postType,
//     this.postDescription,
//     this.image,
//     this.postedBy,
//     this.date,
//     this.isPublished,
//     this.tag,
//     this.createdAt,
//     this.typeName,
//     this.createdBy,
//     this.mappingUser,
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
//   String? tag;
//   String? createdAt;
//   String? typeName;
//   String? createdBy;
//   String? mappingUser;
//
//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//     id: json["id"],
//     postTitle: json["post_title"],
//     postType: json["post_type"],
//     postDescription: json["post_description"],
//     image: json["image"],
//     postedBy: json["posted_by"],
//     date: json["date"],
//     isPublished: json["isPublished"],
//     tag: json["tag"],
//     createdAt: json["created_at"],
//     typeName: json["type_name"],
//     createdBy: json["created_by"],
//     mappingUser: json["mapping_user"],
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
//     "tag": tag,
//     "created_at": createdAt,
//     "type_name": typeName,
//     "created_by": createdBy,
//     "mapping_user": mappingUser,
//   };
// }

// To parse this JSON data, do
//
//     final allPost = allPostFromJson(jsonString);

import 'dart:convert';

AllPost allPostFromJson(String str) => AllPost.fromJson(json.decode(str));

String allPostToJson(AllPost data) => json.encode(data.toJson());

class AllPost {
  AllPost({
    this.status,
    this.totalPosts,
    this.totalActivePosts,
    this.totalPendingPosts,
    this.posts,
  });

  int? status;
  int? totalPosts;
  int? totalActivePosts;
  int? totalPendingPosts;
  List<Post>? posts;

  factory AllPost.fromJson(Map<String, dynamic> json) => AllPost(
    status: json["status"],
    totalPosts: json["total_posts"],
    totalActivePosts: json["total_active_posts"],
    totalPendingPosts: json["total_pending_posts"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_posts": totalPosts,
    "total_active_posts": totalActivePosts,
    "total_pending_posts": totalPendingPosts,
    "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

// class Post {
//   Post({
//     this.id,
//     this.postTitle,
//     this.postType,
//     this.postDescription,
//     this.image,
//     this.postedBy,
//     this.date,
//     this.isPublished,
//     this.tag,
//     this.createdAt,
//   });
//
//   String? id;
//   String? postTitle;
//   String? postType;
//   String? postDescription;
//   String? image;
//   String? postedBy;
//   String? date;
//   String? isPublished;
//   String? tag;
//   String? createdAt;
//
//
//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//     id: json["id"],
//     postTitle: json["post_title"],
//     postType: json["post_type"],
//     postDescription: json["post_description"],
//     image: json["image"],
//     postedBy: json["posted_by"],
//     date: json["date"],
//     isPublished: json["isPublished"] == null ? null : json["isPublished"],
//     tag: json["tag"] == null ? null : json["tag"],
//     createdAt: json["created_at"],
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
//     "isPublished": isPublished == null ? null : isPublished,
//     "tag": tag == null ? null : tag,
//     "created_at": createdAt,
//   };
// }


Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
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


  factory Post.fromJson(Map<String, dynamic> json) => Post(
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



