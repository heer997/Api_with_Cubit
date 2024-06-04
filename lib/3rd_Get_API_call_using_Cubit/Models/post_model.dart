class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": this.id,
  //     "title": this.title,
  //     "body": this.body,
  //   };
  // }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map["id"] as int,
      title: map["title"] as String,
      body: map["body"] as String,
    );
  }
}
