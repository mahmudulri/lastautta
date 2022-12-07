
import 'dart:convert';

JobPostModel jobPostModelFromJson(String str) => JobPostModel.fromJson(json.decode(str));

String jobPostModelToJson(JobPostModel data) => json.encode(data.toJson());

class JobPostModel {
  JobPostModel({
    this.companyName,
    this.jobType,
    this.jobTitle,
    this.jobDescription,
    this.jobLink,
    this.jobImage,
    this.jobPostedBy,
    this.jobLocation,
    this.isJobPublished,
    this.isJobIsArchived,
    this.applicationDeadline,
    this.departmentName,
  });

  JobPostModel.withId({
    this.jobId,
    this.companyName,
    this.jobType,
    this.jobTitle,
    this.jobDescription,
    this.jobLink,
    this.jobImage,
    this.jobPostedBy,
    this.jobLocation,
    this.isJobPublished,
    this.isJobIsArchived,
    this.applicationDeadline,
    this.departmentName,
  });
  int? jobId;
  String? companyName;
  String? jobType;
  String? jobTitle;
  String? jobDescription;
  String? jobLink;
  String? jobImage;
  String? jobPostedBy;
  String? jobLocation;
  String? isJobPublished;
  String? isJobIsArchived;
  String? applicationDeadline;
  String? departmentName;

  factory JobPostModel.fromJson(Map<String, dynamic> json) => JobPostModel.withId(
    jobId: json["id"],
    companyName: json["companyName"],
    jobType: json["jobType"],
    jobDescription: json["jobDescription"],
    jobLink: json["jobLink"],
    jobTitle: json["jobTitle"],
    jobImage: json["jobImage"],
    jobPostedBy: json["jobPostedBy"],
    jobLocation: json["jobLocation"],
    isJobPublished: json["isJobPublished"],
    isJobIsArchived: json["isJobIsArchived"],
    applicationDeadline: json["applicationDeadline"],
    departmentName: json["departmentName"],
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "companyName": companyName,
    "jobType": jobType,
    "jobDescription": jobDescription,
    "jobLink": jobLink,
    "jobTitle": jobTitle,
    "jobImage": jobImage,
    "jobPostedBy": jobPostedBy,
    "jobLocation": jobLocation,
    "isJobPublished": isJobPublished,
    "isJobIsArchived": isJobIsArchived,
    "applicationDeadline": applicationDeadline,
    "departmentName": departmentName,
  };
}