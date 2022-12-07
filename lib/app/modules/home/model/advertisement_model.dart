// To parse this JSON data, do
//
//     final advertisement = advertisementFromJson(jsonString);

import 'dart:convert';

Advertisement advertisementFromJson(String str) => Advertisement.fromJson(json.decode(str));

String advertisementToJson(Advertisement data) => json.encode(data.toJson());

class Advertisement {
  Advertisement({
    this.status,
    this.allAdvertisements,
    this.totalActiveAdvertisements,
    this.totalArchiveAdvertisements,
  });

  int? status;
  List<AllAdvertisement>? allAdvertisements;
  int? totalActiveAdvertisements;
  int? totalArchiveAdvertisements;

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    status: json["status"],
    allAdvertisements: List<AllAdvertisement>.from(json["all_advertisements"].map((x) => AllAdvertisement.fromJson(x))),
    totalActiveAdvertisements: json["total_active_advertisements"],
    totalArchiveAdvertisements: json["total_archive_advertisements"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "all_advertisements": List<dynamic>.from(allAdvertisements!.map((x) => x.toJson())),
    "total_active_advertisements": totalActiveAdvertisements,
    "total_archive_advertisements": totalArchiveAdvertisements,
  };
}

// class AllAdvertisement {
//   AllAdvertisement({
//     this.advertisementTitle,
//     this.postedBy,
//     this.advertisementDescription,
//     this.homePage,
//     this.viewJobPage,
//     this.viewAdvmentPage,
//     this.createAdvmentPage,
//     this.addGeneralPostPage,
//     this.addEventPage,
//     this.image,
//     this.showTime,
//     this.showDays,
//     this.redirectLink,
//     this.position,
//     this.showMobile,
//     this.showDesktop,
//     this.isArchived,
//     this.createdAt,
//
//   });
//
//   String? advertisementTitle;
//   String? postedBy;
//
//   String? advertisementDescription;
//   String? homePage;
//   String? viewJobPage;
//   String? viewAdvmentPage;
//   String? createAdvmentPage;
//   String? addGeneralPostPage;
//   String? addEventPage;
//   String? image;
//   String? showTime;
//   String? showDays;
//   String? redirectLink;
//   String? position;
//   String? showMobile;
//   String? showDesktop;
//   String? isArchived;
//   String?  createdAt;
//
//   factory AllAdvertisement.fromJson(Map<String, dynamic> json) => AllAdvertisement(
//     advertisementTitle: json["advertisement_title"],
//     postedBy: json["posted_by"],
//     advertisementDescription: json["advertisement_description"],
//     homePage: json["home_page"],
//     viewJobPage: json["view_job_page"],
//     viewAdvmentPage: json["view_advment_page"],
//     createAdvmentPage: json["create_advment_page"],
//     addGeneralPostPage: json["add_general_post_page"],
//     addEventPage: json["add_event_page"],
//     image: json["image"],
//     showTime: json["show_time"],
//     showDays: json["show_days"],
//     redirectLink: json["redirect_link"],
//     position: json["position"],
//     showMobile: json["showMobile"],
//     showDesktop: json["showDesktop"],
//     isArchived: json["isArchived"],
//     createdAt: json["created_at"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//
//     "advertisement_title": advertisementTitle,
//     "posted_by": postedBy,
//     "advertisement_description": advertisementDescription,
//     "home_page": homePage,
//     "view_job_page": viewJobPage,
//     "view_advment_page": viewAdvmentPage,
//     "create_advment_page": createAdvmentPage,
//     "add_general_post_page": addGeneralPostPage,
//     "add_event_page": addEventPage,
//     "image": image,
//     "show_time": showTime,
//     "show_days": showDays,
//     "redirect_link": redirectLink,
//     "position": position,
//     "showMobile": showMobile,
//     "showDesktop": showDesktop,
//     "isArchived": isArchived,
//     "created_at": createdAt,
//
//   };
// }


AllAdvertisement allAdvertisementFromJson(String str) => AllAdvertisement.fromJson(json.decode(str));

String allAdvertisementToJson(AllAdvertisement data) => json.encode(data.toJson());

class AllAdvertisement {
  AllAdvertisement({
    this.id,
    this.advertisementTitle,
    this.postedBy,
    this.advertisementDescription,
    this.homePage,
    this.viewJobPage,
    this.viewAdvmentPage,
    this.createAdvmentPage,
    this.addGeneralPostPage,
    this.addEventPage,
    this.image,
    this.showTime,
    this.showDays,
    this.advertisementFee,
    this.lastShowDays,
    this.redirectLink,
    this.paymentType,
    this.position,
    this.showMobile,
    this.showDesktop,
    this.isPublished,
    this.createdAt,

  });

  int? id;
  String? advertisementTitle;
  String? postedBy;
  String? advertisementDescription;
  String? homePage;
  String? viewJobPage;
  String? viewAdvmentPage;
  String? createAdvmentPage;
  String? addGeneralPostPage;
  String? addEventPage;
  String? image;
  String? showTime;
  String? showDays;
  String? advertisementFee;
  String?  lastShowDays;
  String? redirectLink;
  String? paymentType;
  String? position;
  int? showMobile;
  int? showDesktop;
  String? isPublished;
  String?  createdAt;


  factory AllAdvertisement.fromJson(Map<String, dynamic> json) => AllAdvertisement(
    id: json["id"],
    advertisementTitle: json["advertisement_title"],
    postedBy: json["posted_by"],
    advertisementDescription: json["advertisement_description"],
    homePage: json["home_page"],
    viewJobPage: json["view_job_page"],
    viewAdvmentPage: json["view_advment_page"],
    createAdvmentPage: json["create_advment_page"],
    addGeneralPostPage: json["add_general_post_page"],
    addEventPage: json["add_event_page"],
    image: json["image"],
    showTime: json["show_time"],
    showDays: json["show_days"],
    advertisementFee: json["advertisement_fee"],
    lastShowDays: json["last_show_days"],
    redirectLink: json["redirect_link"],
    paymentType: json["payment_type"],
    position: json["position"],
    showMobile: json["showMobile"],
    showDesktop: json["showDesktop"],
    isPublished: json["isPublished"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advertisement_title": advertisementTitle,
    "posted_by": postedBy,
    "advertisement_description": advertisementDescription,
    "home_page": homePage,
    "view_job_page": viewJobPage,
    "view_advment_page": viewAdvmentPage,
    "create_advment_page": createAdvmentPage,
    "add_general_post_page": addGeneralPostPage,
    "add_event_page": addEventPage,
    "image": image,
    "show_time": showTime,
    "show_days": showDays,
    "advertisement_fee": advertisementFee,
    "last_show_days": lastShowDays,
    "redirect_link": redirectLink,
    "payment_type": paymentType,
    "position": position,
    "showMobile": showMobile,
    "showDesktop": showDesktop,
    "isPublished": isPublished,
    "created_at": createdAt,

  };
}

