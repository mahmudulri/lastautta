// // To parse this JSON data, do
// //
// //     final userAllPost = userAllPostFromJson(jsonString);
//
// import 'dart:convert';
//
// UserAllPost userAllPostFromJson(String str) => UserAllPost.fromJson(json.decode(str));
//
// String userAllPostToJson(UserAllPost data) => json.encode(data.toJson());
//
// class UserAllPost {
//   UserAllPost({
//     this.status,
//     this.userAllPosts,
//   });
//
//   int? status;
//   List<UserAllPostElement>? userAllPosts;
//
//   factory UserAllPost.fromJson(Map<String, dynamic> json) => UserAllPost(
//     status: json["status"],
//     userAllPosts: List<UserAllPostElement>.from(json["user_all_posts"].map((x) => UserAllPostElement.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "user_all_posts": List<dynamic>.from(userAllPosts!.map((x) => x.toJson())),
//   };
// }
//
// class UserAllPostElement {
//   UserAllPostElement({
//     this.fullName,
//     this.email,
//     this.officeEmail,
//     this.phoneNo,
//     this.batch,
//     this.jobSector,
//     this.bloodGroup,
//     this.userRole,
//     this.nickName,
//     this.jobSubSector,
//     this.confirmPassword,
//     this.presentAddress,
//     this.permanentAddress,
//     this.officeAddress,
//     this.nameOfCompany,
//     this.addressId,
//     this.stream,
//     this.userPost,
//     this.jobPost,
//   });
//
//   String? fullName;
//   String? email;
//   String? officeEmail;
//   String? phoneNo;
//   String? batch;
//   String? jobSector;
//   String? bloodGroup;
//   String? userRole;
//   String? nickName;
//   String? jobSubSector;
//   String? confirmPassword;
//   String? presentAddress;
//   String? permanentAddress;
//   String? officeAddress;
//   String? nameOfCompany;
//   String? addressId;
//   String? stream;
//   List<UserPost>? userPost;
//   List<JobPost>? jobPost;
//
//   factory UserAllPostElement.fromJson(Map<String, dynamic> json) => UserAllPostElement(
//     fullName: json["full_name"],
//     email: json["email"],
//     officeEmail: json["office_email"],
//     phoneNo: json["phone_no"],
//     batch: json["batch"],
//     jobSector: json["job_sector"],
//     bloodGroup: json["blood_group"],
//     userRole: json["user_role"],
//     nickName: json["nick_name"],
//     jobSubSector: json["job_sub_sector"],
//     confirmPassword: json["confirm_password"],
//     presentAddress: json["present_address"],
//     permanentAddress: json["permanent_address"],
//     officeAddress: json["office_address"],
//     nameOfCompany: json["name_of_company"],
//     addressId: json["address_id"],
//     stream: json["stream"],
//     userPost: List<UserPost>.from(json["user_post"].map((x) => UserPost.fromJson(x))),
//     jobPost: List<JobPost>.from(json["job_post"].map((x) => JobPost.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "full_name": fullName,
//     "email": email,
//     "office_email": officeEmail,
//     "phone_no": phoneNo,
//     "batch": batch,
//     "job_sector": jobSector,
//     "blood_group": bloodGroup,
//     "user_role": userRole,
//     "nick_name": nickName,
//     "job_sub_sector": jobSubSector,
//     "confirm_password": confirmPassword,
//     "present_address": presentAddress,
//     "permanent_address": permanentAddress,
//     "office_address": officeAddress,
//     "name_of_company": nameOfCompany,
//     "address_id": addressId,
//     "stream": stream,
//     "user_post": List<dynamic>.from(userPost!.map((x) => x.toJson())),
//     "job_post": List<dynamic>.from(jobPost!.map((x) => x.toJson())),
//   };
// }
// //
// // class JobPost {
// //   JobPost({
// //     this.id,
// //     this.jobUniqueId,
// //     this.companyName,
// //     this.jobType,
// //     this.departmentId,
// //     this.jobTitle,
// //     this.jobDescription,
// //     this.jobLink,
// //     this.image,
// //     this.postedBy,
// //     this.jobLocation,
// //     this.isPublished,
// //     this.isArchived,
// //     this.applicationDeadline,
// //     this.createdAt,
// //   });
// //
// //   int? id;
// //   String? jobUniqueId;
// //   String? companyName;
// //   String? jobType;
// //   String? departmentId;
// //   String? jobTitle;
// //   String? jobDescription;
// //   String? jobLink;
// //   String? image;
// //   String? postedBy;
// //   String? jobLocation;
// //   int? isPublished;
// //   int? isArchived;
// //   String? applicationDeadline;
// //   String? createdAt;
// //
// //   factory JobPost.fromJson(Map<String, dynamic> json) => JobPost(
// //     id:json["id"],
// //     jobUniqueId: json["job_unique_id"],
// //     companyName: json["company_name"],
// //     jobType: json["job_type"],
// //     departmentId: json["department_id"],
// //     jobTitle: json["job_title"],
// //     jobDescription: json["job_description"],
// //     jobLink: json["job_link"],
// //     image: json["image"],
// //     postedBy: json["posted_by"],
// //     jobLocation: json["job_location"],
// //     isPublished: json["isPublished"],
// //     isArchived: json["isArchived"],
// //     applicationDeadline: json["application_deadline"],
// //     createdAt: json["created_at"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id":id,
// //     "job_unique_id": jobUniqueId,
// //     "company_name": companyName,
// //     "job_type": jobType,
// //     "department_id": departmentId,
// //     "job_title": jobTitle,
// //     "job_description": jobDescription,
// //     "job_link": jobLink,
// //     "image": image,
// //     "posted_by": postedBy,
// //     "job_location": jobLocation,
// //     "isPublished": isPublished,
// //     "isArchived": isArchived,
// //     "application_deadline": applicationDeadline,
// //     "created_at": createdAt,
// //   };
// // }
//
// class JobPost {
//   JobPost({
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
//   int? id;
//   String? jobUniqueId;
//   String? companyName;
//   String? jobType;
//   dynamic departmentId;
//   String? jobTitle;
//   String? jobDescription;
//   String? jobLink;
//   String? image;
//   String? postedBy;
//   String? jobLocation;
//   int? isPublished;
//   int? isArchived;
//   String? applicationDeadline;
//   String? createdAt;
//   dynamic deptName;
//   dynamic jobTypeId;
//   dynamic typeName;
//
//   factory JobPost.fromJson(Map<String, dynamic> json) => JobPost(
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
//
// // class UserPost {
// //   UserPost({
// //     this.id,
// //     this.postTitle,
// //     this.postType,
// //     this.postDescription,
// //     this.image,
// //     this.postedBy,
// //     this.date,
// //     this.isPublished,
// //     this.isArchived,
// //     this.tag,
// //     this.createdAt,
// //   });
// //
// //   int? id;
// //   String? postTitle;
// //   String? postType;
// //   String? postDescription;
// //   String? image;
// //   String? postedBy;
// //   String? date;
// //   int? isPublished;
// //   int? isArchived;
// //   String? tag;
// //   String? createdAt;
// //
// //   factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
// //     id:json["id"],
// //     postTitle: json["post_title"],
// //     postType: json["post_type"],
// //     postDescription: json["post_description"],
// //     image: json["image"],
// //     postedBy: json["posted_by"],
// //     date: json["date"] == null ? null : json["date"],
// //     isPublished: json["isPublished"],
// //     isArchived: json["isArchived"],
// //     tag: json["tag"],
// //     createdAt:json["created_at"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id":id,
// //     "post_title": postTitle,
// //     "post_type": postType,
// //     "post_description": postDescription,
// //     "image": image,
// //     "posted_by": postedBy,
// //     "date": date == null ? null : date,
// //     "isPublished": isPublished,
// //     "isArchived": isArchived,
// //     "tag": tag,
// //     "created_at": createdAt,
// //   };
// // }
//
// class UserPost {
//   UserPost({
//     this.id,
//     this.postTitle,
//     this.postType,
//     this.postDescription,
//     this.image,
//     this.postedBy,
//     this.date,
//     this.isArchived,
//     this.isPublished,
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
//   int? isArchived;
//   String? isPublished;
//   String? tag;
//   String? createdAt;
//
//
//   factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
//     id: json["id"],
//     postTitle: json["post_title"],
//     postType: json["post_type"],
//     postDescription: json["post_description"],
//     image: json["image"],
//     postedBy: json["posted_by"],
//     date: json["date"],
//     isArchived: json["isArchived"],
//     isPublished: json["isPublished"],
//     tag: json["tag"],
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
//     "isArchived": isArchived,
//     "isPublished": isPublished,
//     "tag": tag,
//     "created_at": createdAt,
//   };
// }


// To parse this JSON data, do
//
//     final userAllPost = userAllPostFromJson(jsonString);

// To parse this JSON data, do
//
//     final userAllPost = userAllPostFromJson(jsonString);

import 'dart:convert';

UserAllPost userAllPostFromJson(String str) => UserAllPost.fromJson(json.decode(str));

String userAllPostToJson(UserAllPost data) => json.encode(data.toJson());

class UserAllPost {
  UserAllPost({
    this.status,
    this.userAllPosts,
  });

  int? status;
  List<UserAllPostElement>? userAllPosts;

  factory UserAllPost.fromJson(Map<String, dynamic> json) => UserAllPost(
    status: json["status"],
    userAllPosts: List<UserAllPostElement>.from(json["user_all_posts"].map((x) => UserAllPostElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user_all_posts": List<dynamic>.from(userAllPosts!.map((x) => x.toJson())),
  };
}

class UserAllPostElement {
  UserAllPostElement({
    this.id,
    this.fullName,
    this.nickName,
    this.email,
    this.phoneNo,
    this.batch,
    this.bloodGroup,
    this.stream,
    this.userRole,
    this.jobSector,
    this.jobSubSector,
    this.officeEmail,
    this.officeAddress,
    this.nameOfCompany,
    this.presentAddress,
    this.permanentAddress,
    this.image,
    this.emailVerifiedAt,
    this.otpVerify,
    this.deviceToken,
    this.confirmPassword,
    this.createdAt,
    this.userPost,
    this.jobPost,
  });

  int? id;
  String? fullName;
  String? nickName;
  String? email;
  String? phoneNo;
  String? batch;
  String? bloodGroup;
  String? stream;
  String? userRole;
  String? jobSector;
  String? jobSubSector;
  String? officeEmail;
  String? officeAddress;
  String? nameOfCompany;
  String? presentAddress;
  String? permanentAddress;
  String? image;
  dynamic emailVerifiedAt;
  dynamic otpVerify;
  String? deviceToken;
  String? confirmPassword;
  String?  createdAt;
  List<UserPost>? userPost;
  List<JobPost>? jobPost;

  factory UserAllPostElement.fromJson(Map<String, dynamic> json) => UserAllPostElement(
    id: json["id"],
    fullName: json["full_name"],
    nickName: json["nick_name"],
    email: json["email"],
    phoneNo: json["phone_no"],
    batch: json["batch"],
    bloodGroup: json["blood_group"],
    stream: json["stream"],
    userRole: json["user_role"],
    jobSector: json["job_sector"],
    jobSubSector: json["job_sub_sector"],
    officeEmail: json["office_email"],
    officeAddress: json["office_address"],
    nameOfCompany: json["name_of_company"],
    presentAddress: json["present_address"],
    permanentAddress: json["permanent_address"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    otpVerify: json["otp_verify"],
    deviceToken: json["device_token"],
    confirmPassword: json["confirm_password"],
    createdAt: json["created_at"],
    userPost: List<UserPost>.from(json["user_post"].map((x) => UserPost.fromJson(x))),
    jobPost: List<JobPost>.from(json["job_post"].map((x) => JobPost.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "nick_name": nickName,
    "email": email,
    "phone_no": phoneNo,
    "batch": batch,
    "blood_group": bloodGroup,
    "stream": stream,
    "user_role": userRole,
    "job_sector": jobSector,
    "job_sub_sector": jobSubSector,
    "office_email": officeEmail,
    "office_address": officeAddress,
    "name_of_company": nameOfCompany,
    "present_address": presentAddress,
    "permanent_address": permanentAddress,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "otp_verify": otpVerify,
    "device_token": deviceToken,
    "confirm_password": confirmPassword,
    "created_at": createdAt,
    "user_post": List<dynamic>.from(userPost!.map((x) => x.toJson())),
    "job_post": List<dynamic>.from(jobPost!.map((x) => x.toJson())),
  };
}

class JobPost {
  JobPost({
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
    this.updatedBy,
    this.jobLocation,
    this.isPublished,
    this.isArchived,
    this.applicationDeadline,
    this.createdAt,
  });

  int? id;
  String? jobUniqueId;
  String? companyName;
  String? jobType;
  String? departmentId;
  String? jobTitle;
  String? jobDescription;
  dynamic jobLink;
  String? image;
  String? postedBy;
  dynamic updatedBy;
  String? jobLocation;
  int? isPublished;
  int? isArchived;
  String? applicationDeadline;
  String? createdAt;


  factory JobPost.fromJson(Map<String, dynamic> json) => JobPost(
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
    updatedBy: json["updated_by"],
    jobLocation: json["job_location"],
    isPublished: json["isPublished"],
    isArchived: json["isArchived"],
    applicationDeadline: json["application_deadline"],
    createdAt: json["created_at"],
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
    "updated_by": updatedBy,
    "job_location": jobLocation,
    "isPublished": isPublished,
    "isArchived": isArchived,
    "application_deadline": applicationDeadline,
    "created_at": createdAt,

  };
}

class UserPost {
  UserPost({
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


  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
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
