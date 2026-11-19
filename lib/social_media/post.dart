class Post {
  final String username;
  final String caption;
  final String imageUrl;
  int likes;
  bool isLiked;
  final List<String> comments;

  Post({
    required this.username,
    required this.caption,
    required this.imageUrl,
    this.likes = 0,
    this.isLiked = false,
    List<String>? comments,
  }) : comments = comments ?? [];
}