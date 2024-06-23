import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class CustomBlogTypesListWidget extends StatefulWidget {
  const CustomBlogTypesListWidget({
    super.key,
    required this.selectedType,
  });
  final List<String> selectedType;
  @override
  State<CustomBlogTypesListWidget> createState() =>
      _CustomBlogTypesListWidgetState();
}

class _CustomBlogTypesListWidgetState extends State<CustomBlogTypesListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          'Surveying',
          'Gis',
          'Remote Sensing',
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.selectedType.contains(e)) {
                        widget.selectedType.remove(e);
                      } else {
                        widget.selectedType.add(e);
                      }
                      setState(() {});
                    },
                    child: Chip(
                      color: widget.selectedType.contains(e)
                          ? const WidgetStatePropertyAll(AppPallete.gradient1)
                          : null,
                      label: Text(e),
                      side: widget.selectedType.contains(e)
                          ? null
                          : const BorderSide(color: AppPallete.borderColor),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
