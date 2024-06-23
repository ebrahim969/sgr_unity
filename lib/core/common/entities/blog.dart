class Blog {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final List<String>? imageUrl;
  final DateTime updatedAt;
  final List<String> topics;
  final String? posterName;
  final String? posterAvatar;

  Blog(
      {required this.id,
      required this.posterId,
      required this.title,
      required this.content,
      this.imageUrl,
      required this.updatedAt,
      required this.topics,
      this.posterName,
      this.posterAvatar,
      });
}
