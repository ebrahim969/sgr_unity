import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class CustomBlogCardTopics extends StatelessWidget {
  const CustomBlogCardTopics({super.key, required this.topics});

  final List<String> topics;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: topics
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Chip(
                    side: const BorderSide(color: AppPallete.gradient3),
                    label: Text(e),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
