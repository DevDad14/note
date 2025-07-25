import 'package:dio/dio.dart';
import 'package:noteapp/models/post.dart';

class HomeService {
  HomeService(_);

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      contentType: 'application/json',
    ),
  );

  static Future<List<Post>> getPosts() async {
    try {
      List<Post> posts = [];
      final response = await _dio.get('/posts');
      for (var i = 0; i < response.data.length; i++) {
        Post post = Post.fromJson(response.data[i]);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      print(e);
      throw Exception('Failed to load posts');
    }
  }
}
