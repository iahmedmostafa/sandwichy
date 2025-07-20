import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/asset/app_assets.dart';
import '../../../core/style/app_text_styles.dart';

class CustomTopHomeScreen extends StatelessWidget {
  const CustomTopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260.h,
          width: 632.w,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppAssets.homeScreen),fit: BoxFit.fill)
          ),
        ),
        Positioned(
            left:19.w ,
            top:40.h ,
            bottom:30.h ,
            child: Container(
              width:195.w,
              height: 186.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
                color: Color(0xffFE8C00).withOpacity(.2),
              ),
              child: Text("Welcome\nAre you\nHungry?..😋",style: AppTextStyles.onBoardingTitle,textAlign: TextAlign.center,),
            ))
      ],
    );
  }
}
