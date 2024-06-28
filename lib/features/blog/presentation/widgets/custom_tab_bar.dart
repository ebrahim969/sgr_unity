import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

TabBar customTabBar(TabController? controller, List<String> topics) {
  return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      controller: controller,
      indicatorColor: AppPallete.gradient2,
      labelColor: AppPallete.gradient1,
      unselectedLabelColor: AppPallete.greyColor,
      tabs: topics.map((e) {
        return Tab(
          text: e,
        );
      }).toList());
}
