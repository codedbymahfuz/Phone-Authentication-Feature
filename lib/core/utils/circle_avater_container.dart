import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:phone_auth/core/constants/appcolors.dart';

class CircularIconWrapper extends StatelessWidget {

   final String iconName;
  const CircularIconWrapper({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.circularAvaterColor,
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: AppColors.blueColor),
      ),

      child: Center(
        child: Image.asset(
          "lib/assets/images/$iconName",
          height: 70.h,
          width: 70.w,
          fit: BoxFit.contain,
          
        ),
      ),
    );
  }
}
