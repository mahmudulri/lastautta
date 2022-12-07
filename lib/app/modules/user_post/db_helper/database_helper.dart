

import 'dart:io';

import 'package:aust_textile_alumni/app/modules/user_post/model/jobpost_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/model/post_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static Database? _database;                // Singleton Database

  String postTable = 'post_table';
  String id = 'id';
  String postTitle = 'postTitle';
  String postType = 'postType';
  String postDescription = 'postDescription';
  String image = 'image';
  String postedBy = 'postedBy';
  String date = 'date';
  String isPublished = 'isPublished';
  String tag = 'tag';


  String jobPostTable = 'job_table';
  String jobId = 'jobId';
  String companyName = 'companyName';
  String jobType = 'jobType';
  String jobDescription = 'jobDescription';
  String jobLink = 'jobLink';
  String jobTitle = 'jobTitle';
  String jobImage = 'jobImage';
  String jobPostedBy = 'jobPostedBy';
  String jobLocation = 'jobLocation';
  String isJobPublished = 'isJobPublished';
  String isJobIsArchived= 'isJobIsArchived';
  String applicationDeadline = 'applicationDeadline';
  String departmentName = 'departmentName';


  DatabaseHelper._privateConstuctor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstuctor();



  Future<Database?> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'post.db';

    // Open/create the database at a given path
    var postDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return postDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $postTable($id INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$postTitle TEXT, '
        '$postType TEXT, '
        '$postDescription TEXT, '
        '$image TEXT, '
        '$postedBy TEXT, '
        '$date TEXT, '
        '$isPublished TEXT, '
        '$tag TEXT)');


    await db.execute( '''
         CREATE TABLE $jobPostTable($jobId INTEGER PRIMARY KEY AUTOINCREMENT, 
         $companyName TEXT, 
         $jobType TEXT, 
         $jobTitle TEXT, 
         $jobDescription TEXT, 
         $jobLink TEXT, 
         $jobLocation TEXT, 
         $jobImage TEXT, 
         $jobPostedBy TEXT,
         $isJobPublished TEXT, 
         $isJobIsArchived TEXT, 
         $applicationDeadline TEXT, 
         $departmentName TEXT)
         '''
    );


  }


  Future<List<Map<String, dynamic>>> getPostMapList() async {
    Database? db = await this.database;

    var result = await db!.query(postTable);
    return result;
  }

  Future<int> insertPost(PostModel post) async {
    Database? db = await this.database;
    var result = await db!.insert(postTable, post.toJson());
    return result;
  }


  Future<int> updatePost(PostModel post) async {
    var db = await this.database;
    var result = await db!.update(postTable, post.toJson(), where: '$id = ?', whereArgs: [post.id]);
    return result;
  }

  Future<int> deletePost(int id) async {
    var db = await this.database;
    int result = await db!.rawDelete('DELETE FROM $postTable WHERE $id = $id');
    return result;
  }


  Future<List<PostModel>> getPostList() async {

    var postMapList = await getPostMapList();
    int count = postMapList.length;

    List<PostModel> postList = <PostModel>[];
    for (int i = 0; i < count; i++) {
      postList.add(PostModel.fromJson(postMapList[i]));
    }

    return postList;
  }

  Future<int> insertJobPost(JobPostModel jobPostModel) async {
    Database? db = await this.database;
    var result = await db!.insert(jobPostTable, jobPostModel.toJson());
    return result;
  }

  Future<List<Map<String, dynamic>>> getJobPostMapList() async {
    Database? db = await this.database;

    var result = await db!.query(jobPostTable);
    return result;
  }

  Future<int> updateJobPost(JobPostModel jobPostModel) async {
    var db = await this.database;
    var result = await db!.update(postTable, jobPostModel.toJson(), where: '$id = ?', whereArgs: [jobPostModel.jobId]);
    return result;
  }

  Future<int> deleteJobPost(int id) async {
    var db = await this.database;
    int result = await db!.rawDelete('DELETE FROM $jobPostTable WHERE $id = $id');
    return result;
  }

  Future<List<JobPostModel>> getJobPostList() async {

    var postMapList = await getPostMapList();
    int count = postMapList.length;

    List<JobPostModel> jobPostList = <JobPostModel>[];
    for (int i = 0; i < count; i++) {
      jobPostList.add(JobPostModel.fromJson(postMapList[i]));
    }

    return jobPostList;
  }


  Future close() async {
    Database? db = await this.database;
    db!.close();

  }

}