import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/pages/blog_view.dart';
import 'package:sgr_unity/features/blog/presentation/pages/saved_blogs_view.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/pages/profile_view.dart';
import 'package:sgr_unity/features/search/presentation/bloc/search_bloc.dart';
import 'package:sgr_unity/features/search/presentation/pages/search_view.dart';

PersistentTabController _controller = PersistentTabController();

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      backgroundColor: AppPallete.backgroundColor,
      navBarStyle: NavBarStyle.style9,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const BlogsView(),
    BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: const SearchView(),
    ),
    const SavedBlogView(),
    BlocProvider.value(
      value: sl<ProfileBloc>(),
      child: const ProfileView(),
    ),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      activeColorPrimary: AppPallete.gradient3,
      icon: const Icon(
        Icons.home,
        color: AppPallete.gradient1,
      ),
      inactiveIcon: const Icon(
        Icons.home,
        color: AppPallete.greyColor,
      ),
      title: 'Home',
    ),
    PersistentBottomNavBarItem(
        activeColorPrimary: AppPallete.gradient3,
        icon: const Icon(
          Icons.search_outlined,
          color: AppPallete.gradient1,
        ),
        inactiveIcon: const Icon(
          Icons.search_outlined,
          color: AppPallete.greyColor,
        ),
        title: 'Search'),
    PersistentBottomNavBarItem(
        activeColorPrimary: AppPallete.gradient3,
        icon: const Icon(
          Icons.bookmark_border,
          color: AppPallete.gradient1,
        ),
        inactiveIcon: const Icon(
          Icons.bookmark_border,
          color: AppPallete.greyColor,
        ),
        title: 'Saved'),
    PersistentBottomNavBarItem(
        activeColorPrimary: AppPallete.gradient3,
        icon: const Icon(
          Icons.person,
          color: AppPallete.gradient1,
        ),
        inactiveIcon: const Icon(
          Icons.person,
          color: AppPallete.greyColor,
        ),
        title: 'Profile'),
  ];
}
