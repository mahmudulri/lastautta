// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

Job jobFromJson(String str) => Job.fromJson(json.decode(str));

String jobToJson(Job data) => json.encode(data.toJson());

class Job {
  Job({
    this.status,
    this.latestJobs,
  });


  int? status;
  List<LatestJob>? latestJobs;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
     status: json["status"],
     latestJobs: List<LatestJob>.from(json["latest_jobs"].map((x) => LatestJob.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "latest_jobs": List<dynamic>.from(latestJobs!.map((x) => x.toJson())),

  };
}



// class LatestJob {
//   LatestJob({
//     this.id,
//     this.jobUniqueId,
//     this.companyName,
//     this.jobType,
//     this.departmentId,
//     this.jobTitle,
//     this.jobDescription,
//     this.jobLink,
//     this.image,
//     this.postedBy,
//     this.updatedBy,
//     this.jobLocation,
//     this.isPublished,
//     this.isArchived,
//     this.applicationDeadline,
//     this.createdAt,
//     this.deptName,
//     this.jobTypeId,
//     this.typeName,
//   });
//
//   String? id;
//   String? jobUniqueId;
//   String? companyName;
//   String? jobType;
//   String? departmentId;
//   String? jobTitle;
//   String? jobDescription;
//   dynamic jobLink;
//   String? image;
//   String? postedBy;
//   String? updatedBy;
//   String? jobLocation;
//   String? isPublished;
//   String? isArchived;
//   String? applicationDeadline;
//   String? createdAt;
//   String? deptName;
//   String? jobTypeId;
//   String? typeName;
//
//   factory LatestJob.fromJson(Map<String, dynamic> json) => LatestJob(
//     id: json["id"],
//     jobUniqueId: json["job_unique_id"],
//     companyName: json["company_name"],
//     jobType: json["job_type"],
//     departmentId: json["department_id"],
//     jobTitle: json["job_title"],
//     jobDescription: json["job_description"],
//     jobLink: json["job_link"],
//     image: json["image"],
//     postedBy: json["posted_by"],
//     updatedBy: json["updated_by"],
//     jobLocation: json["job_location"],
//     isPublished: json["isPublished"],
//     isArchived: json["isArchived"],
//     applicationDeadline: json["application_deadline"],
//     createdAt: json["created_at"],
//     deptName: json["dept_name"],
//     jobTypeId: json["job_type_id"],
//     typeName: json["type_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "job_unique_id": jobUniqueId,
//     "company_name": companyName,
//     "job_type": jobType,
//     "department_id": departmentId,
//     "job_title": jobTitle,
//     "job_description": jobDescription,
//     "job_link": jobLink,
//     "image": image,
//     "posted_by": postedBy,
//     "updated_by": updatedBy,
//     "job_location": jobLocation,
//     "isPublished": isPublished,
//     "isArchived": isArchived,
//     "application_deadline": applicationDeadline,
//     "created_at": createdAt,
//     "dept_name": deptName,
//     "job_type_id": jobTypeId,
//     "type_name": typeName,
//   };
// }


LatestJob latestJobFromJson(String str) => LatestJob.fromJson(json.decode(str));

String latestJobToJson(LatestJob data) => json.encode(data.toJson());

class LatestJob {
  LatestJob({
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
  dynamic departmentId;
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
  dynamic deptName;
  dynamic jobTypeId;
  dynamic typeName;

  factory LatestJob.fromJson(Map<String, dynamic> json) => LatestJob(
    id: json["id"],
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
    applicationDeadline: json["application_deadline"],
    createdAt: json["created_at"],
    deptName: json["dept_name"],
    jobTypeId: json["job_type_id"],
    typeName: json["type_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "application_deadline": applicationDeadline,
    "created_at": createdAt,
    "dept_name": deptName,
    "job_type_id": jobTypeId,
    "type_name": typeName,
  };
}






