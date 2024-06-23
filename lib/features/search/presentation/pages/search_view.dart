import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/features/search/presentation/bloc/search_bloc.dart';
import 'package:sgr_unity/features/search/presentation/sections/custom_search_view_body.dart';
import 'package:sgr_unity/features/search/presentation/widgets/custom_search_text_feild.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomSearchTextField(
              onChanged: (query) {
                if (query.isEmpty) {
                  context.read<SearchBloc>().add(ClearSearchEvent());
                } else {
                  context.read<SearchBloc>().add(SearchAboutBlogsEvent(query));
                }
              },
            ),
          ],
        ),
      ),
      body: const CustomSearchViewBody(),
    );
  }
}
