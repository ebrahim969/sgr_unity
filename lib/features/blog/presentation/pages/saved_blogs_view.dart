import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/user_saved_blogs/user_saved_blogs_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/sections/saved_view_blogs_body.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';
import 'package:sgr_unity/generated/l10n.dart';

class SavedBlogView extends StatefulWidget {
  const SavedBlogView({super.key});

  @override
  State<SavedBlogView> createState() => _SavedBlogViewState();
}

class _SavedBlogViewState extends State<SavedBlogView> {
  @override
  void initState() {
    final userId =
        (context.read<GetCurrentUserBloc>().state as GetUserSuccess).user.id;
    context.read<UserSavedBlogsBloc>().add(GetUserSavedBlogsEvent(userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: Text(S.of(context).SavedBlogs),
        leading: const Icon(
          Icons.save_alt,
          color: AppPallete.gradient3,
        ),
      ),
      body: const SavedViewBlogsBody(),
    );
  }
}
