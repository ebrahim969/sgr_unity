import 'package:flutter/material.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/sections/blog_view_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required TabController tabController,
    required this.topics,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<String> topics;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        BlogViewBody(
          blogEvent: GetAllBlogsEvent(),
        ),
        BlogViewBody(
          blogEvent: GetTopicBlogsEvent(topics[1]),
        ),
        BlogViewBody(
          blogEvent: GetTopicBlogsEvent(topics[2]),
        ),
        BlogViewBody(
          blogEvent: GetTopicBlogsEvent(topics[3]),
        ),
      ],
    );
  }
}
