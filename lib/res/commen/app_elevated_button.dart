import 'package:api_app/res/commen/media_query.dart';
import 'package:api_app/res/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'appText.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  const AppElevatedButton({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed!,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBlack,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width(context) / 40)),
          fixedSize: Size(width(context), height(context) / 16)),
      child: AppText(
        text: text!,
        color: AppColors.white,
        size: height(context) / 50,
      ),
    );
  }
}
