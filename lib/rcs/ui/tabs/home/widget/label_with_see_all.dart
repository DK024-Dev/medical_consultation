import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';
import 'package:medical_consultation/rcs/utils/app_strings.dart';

class LabelWithSeeAll extends StatefulWidget {
  const LabelWithSeeAll(
      {super.key,
      required this.label,
      required this.seeAllButton,
      this.onPressedSeeAll});
  final String label;
  final bool seeAllButton;
  final VoidCallback? onPressedSeeAll;
  @override
  State<LabelWithSeeAll> createState() => _LabelWithSeeAllState();
}

class _LabelWithSeeAllState extends State<LabelWithSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            color: AppColors().blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        widget.seeAllButton
            ? TextButton(
                onPressed: widget.onPressedSeeAll,
                child: Text(
                  AppStrings.seeAll,
                  style: TextStyle(
                    color: AppColors().blueColor,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
