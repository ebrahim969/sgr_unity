import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/user_saved_blogs/user_saved_blogs_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/sections/home_view_body.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_tab_bar.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

class BlogsView extends StatefulWidget {
  const BlogsView({super.key});

  @override
  State<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends State<BlogsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> topics = ['All', 'Gis', 'Surveying', 'Remote Sensing'];
  @override
  void initState() {
    final userId =
        (context.read<GetCurrentUserBloc>().state as GetUserSuccess).user.id;
    context.read<UserSavedBlogsBloc>().add(GetUserSavedBlogsEvent(userId));
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customNavigate(context, '/AddNewBlogView');
        },
        child: const Icon(
          Icons.post_add,
          color: AppPallete.whiteColor,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80.h,
        title: const Padding(
          padding: EdgeInsets.only(top: 16, left: 8),
          child: Text(
            'SGR Unity',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        bottom: customTabBar(_tabController, topics),
      ),
      body: HomeViewBody(tabController: _tabController, topics: topics),
    );
  }
}
