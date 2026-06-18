import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_auth/core/constants/appcolors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void showCustomDialog({
   required BuildContext context,
   bool isMeessageStage = false,
}) {
  showDialog(
    context: context,
   // barrierDismissible: false,
    builder: (BuildContext context) {

      
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter dialogSetState){
             return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: !isMeessageStage ?
              _buildLoginSuccessAnimation() 
               : _buildWelcomeAnimation() ,);
          })
        ),
      );

    },
  );
}

  void circularCustomDialog (BuildContext context) {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return Center(
          child: CircularProgressIndicator(color: AppColors.blueColor,),
        );
      });
  }

  Widget _buildWelcomeAnimation () {
     return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Lottie.asset(
                  "lib/assets/animations/successfully.json",
                   fit: BoxFit.contain
                ),
              ),
              SizedBox(height: 15.h),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Login Successful...',
                    speed: const Duration(milliseconds: 75),
                    textStyle: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blueColor,
                    ),
                  ),
                ],
                 totalRepeatCount: 1,
              ),
            ],
          );
  }
   Widget _buildLoginSuccessAnimation () {
     return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                // height: 50.h,
                // width: 50.w,
                child: Lottie.asset(
                  "lib/assets/animations/welcomesms.json",
                  height: 50.h,
                  
                   fit: BoxFit.contain
                ),
              ),
             SizedBox(height: 20.h),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'codedbymahfuz',
                    speed: const Duration(milliseconds: 200),
                    textStyle: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
                 totalRepeatCount: 1,
              ),
            ],
          );
  }