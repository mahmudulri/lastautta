

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    this.status,
    this.articleBlogs,
  });

  int? status;
  List<ArticleBlog>? articleBlogs;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    status: json["status"],
    articleBlogs: List<ArticleBlog>.from(json["article_blogs"].map((x) => ArticleBlog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "article_blogs": List<dynamic>.from(articleBlogs!.map((x) => x.toJson())),
  };
}

class ArticleBlog {
  ArticleBlog({
    this.id,
    this.categoryId,
    this.subcategoryId,
    this.articleBlogTitle,
    this.postedBy,
    this.updatedBy,
    this.articleBlogDescription,
    this.articleBlogImage,
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
  String? articleBlogTitle;
  String? postedBy;
  dynamic updatedBy;
  String? articleBlogDescription;
  String? articleBlogImage;
  int? isArchived;
  int? isPublished;
  String? createdAt;
  String? categoryName;
  String? subcategoryName;
  String? fullName;

  factory ArticleBlog.fromJson(Map<String, dynamic> json) => ArticleBlog(
    id: json["id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    articleBlogTitle: json["article_blog_title"],
    postedBy: json["posted_by"],
    updatedBy: json["updated_by"],
    articleBlogDescription: json["article_blog_description"],
    articleBlogImage: json["article_blog_image"],
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
    "article_blog_title": articleBlogTitle,
    "posted_by": postedBy,
    "updated_by": updatedBy,
    "article_blog_description": articleBlogDescription,
    "article_blog_image": articleBlogImage,
    "isArchived": isArchived,
    "isPublished": isPublished,
    "created_at": createdAt,
    "category_name": categoryName,
    "subcategory_name": subcategoryName,
    "full_name": fullName,
  };
}
