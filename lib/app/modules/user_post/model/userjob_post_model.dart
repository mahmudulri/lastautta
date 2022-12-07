// To parse this JSON data, do
//
//     final userJobPost = userJobPostFromJson(jsonString);

import 'dart:convert';

UserJobPost userJobPostFromJson(String str) => UserJobPost.fromJson(json.decode(str));

String userJobPostToJson(UserJobPost data) => json.encode(data.toJson());

class UserJobPost {
  UserJobPost({
    this.status,
    this.jobPosts,
  });

  int? status;
  List<JobPost>? jobPosts;

  factory UserJobPost.fromJson(Map<String, dynamic> json) => UserJobPost(
    status: json["status"],
    jobPosts: List<JobPost>.from(json["job_posts"].map((x) => JobPost.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "job_posts": List<dynamic>.from(jobPosts!.map((x) => x.toJson())),
  };
}

class JobPost {
  JobPost({
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
  });

  String? jobUniqueId;
  String? companyName;
  String? jobType;
  String? departmentId;
  String? jobTitle;
  String? jobDescription;
  dynamic? jobLink;
  String? image;
  String? postedBy;
  String? jobLocation;
  int? isPublished;
  int? isArchived;
  String? applicationDeadline;
  String? createdAt;


  factory JobPost.fromJson(Map<String, dynamic> json) => JobPost(
    jobUniqueId: json["job_unique_id"],
    companyName: json["company_name"],
    jobType: json["job_type"],
    departmentId: json["department_id"],
    jobTitle: json["job_title"],
    jobDescription: json["job_description"],
    jobLink: json["job_link"],
    image: json["image"],
    postedBy: json["posted_by"],
    jobLocation: json["job_location"],
    isPublished: json["isPublished"],
    isArchived: json["isArchived"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "job_unique_id": jobUniqueId,
    "company_name": companyName,
    "job_type": jobType,
    "department_id": departmentId,
    "job_title": jobTitle,
    "job_description": jobDescription,
    "job_link": jobLink,
    "image": image,
    "posted_by": postedBy,
    "job_location": jobLocation,
    "isPublished": isPublished,
    "isArchived": isArchived,
    "created_at": createdAt,
  };
}
