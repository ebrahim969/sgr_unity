import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:sgr_unity/core/utils/custom_dialog.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';

class PopUpMenueWidget extends StatelessWidget {
  const PopUpMenueWidget({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return PopupMenuButton(
          icon: const Icon(
            Icons.more_horiz_outlined,
          ),
          color: state is AppThemeLightMode
              ? AppPallete.lightBackgroundColor
              : AppPallete.darkBackgroundColor,
          itemBuilder: (context) => [
            const PopupMenuItem(
                value: 'Edit',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit',
                    ),
                    Icon(
                      Icons.edit_note_outlined,
                      color: AppPallete.gradient1,
                    )
                  ],
                )),
            const PopupMenuItem(
                value: 'Delete',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delete'),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                )),
          ],
          onSelected: (value) {
            if (value == 'Edit') {
              customNavigate(context, '/EditBlogView', extra: blog);
            } else if (value == 'Delete') {
              customDialog(
                  okText: 'Delete',
                  context: context,
                  desc: "You want to delete this blog?",
                  okTap: () {
                    context
                        .read<BlogBloc>()
                        .add(DeleteBlogEvent(blog.id, blog.imageUrl!));
                    custompopNavigate(context);
                  });
            }
          },
        );
      },
    );
  }
}
