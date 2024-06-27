import 'package:flutter/material.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:share_plus/share_plus.dart';

class CustomShareBlogWidget extends StatelessWidget {
  const CustomShareBlogWidget({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await Share.share(blog.content,
              subject: 'Thanks for using SGR Unity');
        },
        child: const Icon(Icons.share_sharp));
  }
}
