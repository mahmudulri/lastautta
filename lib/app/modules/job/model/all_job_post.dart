// To parse this JSON data, do
//
//     final allJobPost = allJobPostFromJson(jsonString);

import 'dart:convert';

AllJobPost allJobPostFromJson(String str) => AllJobPost.fromJson(json.decode(str));

String allJobPostToJson(AllJobPost data) => json.encode(data.toJson());

class AllJobPost {
  AllJobPost({
    this.status,
    this.count,
    this.posts,
  });

  int? status;
  int? count;
  List<Post>? posts;

  factory AllJobPost.fromJson(Map<String, dynamic> json) => AllJobPost(
    status: json["status"],
    count: json["count"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.jobUniqueId,
    this.companyName,
    this.jobType,
    this.departmentId,
    this.jobTitle,
    this.jobDescription,
    this.jobLink,
    this.image,
    this.postedBy,
    this.jobLocation,
    this.isPublished,
    this.isArchived,
    this.applicationDeadline,
    this.createdAt,
    this.deptName,
    this.jobTypeId,
    this.typeName,
  });

  int? id;
  String? jobUniqueId;
  String? companyName;
  String? jobType;
  int? departmentId;
  String? jobTitle;
  String? jobDescription;
  String? jobLink;
  String? image;
  String? postedBy;
  String? jobLocation;
  int? isPublished;
  int? isArchived;
  String? applicationDeadline;
  String? createdAt;
  String? deptName;
  int? jobTypeId;
  String? typeName;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    jobUniqueId: json["job_unique_id"],
    companyName: json["company_name"],
    jobType: json["job_type"],
    departmentId: json["department_id"] == null ? null : json["department_id"],
    jobTitle: json["job_title"],
    jobDescription: json["job_description"],
    jobLink: json["job_link"] == null ? null : json["job_link"],
    image: json["image"],
    postedBy: json["posted_by"],
    jobLocation: json["job_location"],
    isPublished: json["isPublished"],
    isArchived: json["isArchived"],
    applicationDeadline: json["application_deadline"],
    createdAt: json["created_at"],
    deptName: json["dept_name"] == null ? null : json["dept_name"],
    jobTypeId: json["job_type_id"] == null ? null : json["job_type_id"],
    typeName: json["type_name"] == null ? null : json["type_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_unique_id": jobUniqueId,
    "company_name": companyName,
    "job_type": jobType,
    "department_id": departmentId == null ? null : departmentId,
    "job_title": jobTitle,
    "job_description": jobDescription,
    "job_link": jobLink == null ? null : jobLink,
    "image": image,
    "posted_by": postedBy,
    "job_location": jobLocation,
    "isPublished": isPublished,
    "isArchived": isArchived,
    "application_deadline": applicationDeadline,
    "created_at": createdAt,
    "dept_name": deptName == null ? null : deptName,
    "job_type_id": jobTypeId == null ? null : jobTypeId,
    "type_name": typeName == null ? null : typeName,
  };
}
