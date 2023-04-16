import 'package:flutter/material.dart';

import '../apis/api_post.dart';
import '../models/post.dart';

class PostProvider extends ChangeNotifier {
  Posts? _posts;
  Posts? get posts => _posts;

  String _message = '';
  String get message => _message;

  Future<void> updatePost(Posts post) async {
    try {
      final result = await ApiPost.updatePost(post);
      _posts = result;
      notifyListeners();
    } catch (e) {
      _message = e.toString();
      notifyListeners();
    }
  }
}
