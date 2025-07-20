
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandwichy/core/style/app_text_styles.dart';

import '../core/style/appColors.dart';

class ButtonWidget extends StatelessWidget {
  final String? buttonText;
  final void Function()? onPress;
  final Color? backGrColor;
  final double? width;
  final double? height;
  final double? radius;

   ButtonWidget({super.key,required this.buttonText,required this.onPress, this.backGrColor, this.width, this.height, this.radius});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
         backgroundColor: backGrColor??AppColors.primaryColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(radius??8.r),
         ),
         fixedSize: Size(width??331.w, height??56.h),
       ),
      child: Text(buttonText??" no text",style: AppTextStyles.onBoardingTitle,),
    
    
    );
  }
}

class OutLineButtonWidget extends StatelessWidget {
  final String? buttonText;
  final void Function()? onPress;
  final Color? backGrColor;
  final double? width;
  final double? height;
  final double? radius;

  OutLineButtonWidget({super.key,required this.buttonText,required this.onPress, this.backGrColor, this.width, this.height, this.radius});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backGrColor??AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor,width: 1.w),
          borderRadius: BorderRadius.circular(radius??8.r,),

        ),
        fixedSize: Size(width??331.w, height??56.h),
      ),
      child: Text(buttonText??" no text",style:AppTextStyles.onBoardingTitle),


    );
  }
}
