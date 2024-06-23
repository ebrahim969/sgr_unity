import 'package:sgr_unity/core/common/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.posterId,
    required super.title,
    required super.content,
    super.imageUrl,
    required super.updatedAt,
    required super.topics,
    super.posterName,
    super.posterAvatar,
  });

  Map<String, dynamic> toJson({List<String>? currentImagesUrls}) {
    return <String, dynamic>{
      'id': id,
      'poster_id': posterId,
      'title': title,
      'content': content,
      'image_url': imageUrl ?? currentImagesUrls ?? [],
      'updated_at': updatedAt.toIso8601String(),
      'topics': topics,
    };
  }

  factory BlogModel.fromJson(Map<String, dynamic> map) {
    return BlogModel(
        id: map['id'] as String,
        posterId: map['poster_id'] as String,
        title: map['title'] as String,
        content: map['content'] as String,
        imageUrl: List<String>.from(
          (map['image_url'] ?? []),
        ),
        updatedAt: map['updated_at'] == null
            ? DateTime.now()
            : DateTime.parse(map['updated_at']),
        topics: List<String>.from(
          (map['topics'] ?? []),
        ),);
  }

  BlogModel copyWith({
    String? id,
    String? posterId,
    String? title,
    String? content,
    List<String>? imageUrl,
    DateTime? updatedAt,
    List<String>? topics,
    String? posterName,
    String? posterAvatar,
  }) {
    return BlogModel(
        id: id ?? this.id,
        posterId: posterId ?? this.posterId,
        title: title ?? this.title,
        content: content ?? this.content,
        imageUrl: imageUrl ?? this.imageUrl,
        updatedAt: updatedAt ?? this.updatedAt,
        topics: topics ?? this.topics,
        posterName: posterName ?? this.posterName,
        posterAvatar: posterAvatar ?? this.posterAvatar);
  }
}
