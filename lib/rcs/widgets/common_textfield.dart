import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';
import 'package:medical_consultation/rcs/utils/app_images.dart';

class CommonSearchTextField extends StatelessWidget {
  const CommonSearchTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      validator: null,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: AppColors().whiteColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            AppImages().search,
            color: AppColors().greyColor,
          ),
        ),
        hintText: hintText,
        errorMaxLines: 2,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
