

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.noticeNews,
  });

  int? status;
  List<NoticeNew>? noticeNews;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    noticeNews: List<NoticeNew>.from(json["notice_news"].map((x) => NoticeNew.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "notice_news": List<dynamic>.from(noticeNews!.map((x) => x.toJson())),
  };
}

class NoticeNew {
  NoticeNew({
    this.id,
    this.categoryId,
    this.subcategoryId,
    this.noticeNewsTitle,
    this.postedBy,
    this.updatedBy,
    this.noticeNewsDescription,
    this.noticeNewsImage,
    this.isArchived,
    this.isPublished,
    this.createdAt,
    this.categoryName,
    this.subcategoryName,
    this.fullName,
  });

  int? id;
  String? categoryId;
  String? subcategoryId;
  String? noticeNewsTitle;
  String? postedBy;
  String? updatedBy;
  String? noticeNewsDescription;
  String? noticeNewsImage;
  int? isArchived;
  int? isPublished;
  String? createdAt;
  String? categoryName;
  String? subcategoryName;
  String? fullName;

  factory NoticeNew.fromJson(Map<String, dynamic> json) => NoticeNew(
    id: json["id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    noticeNewsTitle: json["notice_news_title"],
    postedBy: json["posted_by"],
    updatedBy: json["updated_by"],
    noticeNewsDescription: json["notice_news_description"],
    noticeNewsImage: json["notice_news_image"],
    isArchived: json["isArchived"],
    isPublished: json["isPublished"],
    createdAt: json["created_at"],
    categoryName: json["category_name"],
    subcategoryName: json["subcategory_name"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "notice_news_title": noticeNewsTitle,
    "posted_by": postedBy,
    "updated_by": updatedBy,
    "notice_news_description": noticeNewsDescription,
    "notice_news_image": noticeNewsImage,
    "isArchived": isArchived,
    "isPublished": isPublished,
    "created_at": createdAt,
    "category_name": categoryName,
    "subcategory_name": subcategoryName,
    "full_name": fullName,
  };
}
