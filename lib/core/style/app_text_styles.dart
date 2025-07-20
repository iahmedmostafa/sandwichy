import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandwichy/core/style/appColors.dart';

class AppTextStyles{

 static TextStyle onBoardingTitle= GoogleFonts.inter(
   fontSize: 32.sp,
   color: AppColors.whiteColor,
   fontWeight:FontWeight.w600,
  );
 static TextStyle onBoardingButton= GoogleFonts.inter(
   fontSize: 14.sp,
   color: AppColors.whiteColor,
   fontWeight:FontWeight.w600,
 );
 static TextStyle onBoardingDesc= GoogleFonts.inter(
   fontSize: 14.sp,
   color: AppColors.whiteColor,
   fontWeight:FontWeight.w400,
 );
 static TextStyle cardTitle= GoogleFonts.inter(
   fontSize: 16.sp,
   color: AppColors.blackColor,
   fontWeight:FontWeight.w500,
 );
 static TextStyle cardReview= GoogleFonts.inter(
   fontSize: 12.sp,
   color: AppColors.blackColor,
   fontWeight:FontWeight.w500,
 );
 static TextStyle sandwichName= GoogleFonts.inter(
   fontSize: 24.sp,
   color: AppColors.blackColor,
   fontWeight:FontWeight.w400,
 );
 static TextStyle sandwichDesc= GoogleFonts.inter(
   fontSize: 14.sp,
   color: AppColors.greyFont,
   fontWeight:FontWeight.w400,
 );

}