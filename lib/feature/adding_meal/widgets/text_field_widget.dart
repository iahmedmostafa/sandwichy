import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandwichy/core/style/appColors.dart';

class TextFieldWidget extends StatelessWidget {
  final  TextEditingController? controller;
  final String hintText;
   int? maxLines;
  final String? Function(String?)? validator;
  TextFieldWidget({ this.validator, this.maxLines, super.key,required this.controller,required this.hintText,});
   final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines:maxLines??1 ,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          width: .7.w,
          color: AppColors.blackColor,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: .7.w,
            color: AppColors.blackColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: .7.w,
            color:Colors.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),

      ),

    );
  }
}
