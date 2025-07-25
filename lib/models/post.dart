// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final String title;
  final String body;
  final int id;
  final int userId;

  Post({
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });
  
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
      id: json['id'],
      userId: json['userId'],
    );
  }

  @override
  String toString() {
    return 'Post(title: $title, body: $body, id: $id, userId: $userId)';
  }
}
