import 'package:flutter/material.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/sections/blog_view_body.dart';
import 'package:sgr_unity/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final txt = S.of(context);
    return TabBarView(
      controller: _tabController,
      children: [
        BlogViewBody(
          blogEvent: GetAllBlogsEvent(),
        ),
        BlogViewBody(
          blogEvent: GetTopicBlogsEvent(txt.Gis),
        ),
        BlogViewBody(
          blogEvent: GetTopicBlogsEvent(txt.Surveying),
        ),
        BlogViewBody(
          blogEvent: GetTopicBlogsEvent(txt.RemoteSensing),
        ),
      ],
    );
  }
}
