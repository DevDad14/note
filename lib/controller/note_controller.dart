import 'package:flutter/material.dart';
import 'package:noteapp/models/post.dart';
import 'package:noteapp/models/todo.dart';
import 'package:noteapp/services/home_service.dart';

class NoteController with ChangeNotifier {
  List<Post> posts = [];

  Todo? todo;

  Future<void> getPosts() async {
    try {
      final response = await HomeService.getPosts();
      posts = response;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }


  Future<void> addTodo(String title, String description) async {
    try {
      final response = await HomeService.addTodo(Todo(title: title, description: description, completed: false));
      todo = response;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }




}
