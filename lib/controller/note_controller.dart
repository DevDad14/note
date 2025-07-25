import 'package:flutter/material.dart';
import 'package:noteapp/models/post.dart';
import 'package:noteapp/services/home_service.dart';

class NoteController with ChangeNotifier {
  List<Post> posts = [];

  Future<void> getPosts() async {
    try {
      final response = await HomeService.getPosts();
      posts = response;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
