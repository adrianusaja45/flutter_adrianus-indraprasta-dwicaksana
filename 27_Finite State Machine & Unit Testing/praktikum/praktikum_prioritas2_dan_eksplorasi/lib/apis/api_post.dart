import 'package:dio/dio.dart';

import '../models/post.dart';


class ApiPost {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String path = '/posts';
  static const int id = 1;

  static Future<Posts> updatePost(Posts post) async {
    final response = await Dio().put('$baseUrl$path/$id', data: post.toJson());
    if (response.statusCode == 200) {
      return Posts.fromJson(response.data);
    } else {
      throw ('Gagal mengupdate data');
    }
  }
}
