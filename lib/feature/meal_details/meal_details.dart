import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sandwichy/core/style/appColors.dart';
import 'package:sandwichy/core/style/app_text_styles.dart';
import 'package:sandwichy/models/meal_model.dart';
import 'package:sandwichy/widgets/spacing_widgets.dart';

class MealDetails extends StatelessWidget {

  MealModel mealModel;
  MealDetails({super.key, required this.mealModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSpace(30),
            Container(
              width: 360.w,
              height: 330.h,
              alignment: AlignmentDirectional.topStart,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(image:NetworkImage(mealModel.imageUrl),
                  fit: BoxFit.cover,
                ),),
              child: InkWell(
                onTap: (){
                  GoRouter.of(context).pop();
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 35.w,
                      height: 35.h,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: BoxBorder.all(color: AppColors.whiteColor)
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),

              ),


            HeightSpace(16),
            Text(mealModel.title,style: AppTextStyles.sandwichName,),
            HeightSpace(21),
            Center(
              child: Container(
                width: 327.w,
                height: 33.h,
                color: Color(0xffFE8C00).withOpacity(.1),
                child: Row(
                  children: [
                    Icon(Icons.access_time_filled,size: 14.sp,color: AppColors.primaryColor,),
                    Text(mealModel.time,style: AppTextStyles.sandwichDesc,),
                    WidthSpace(202),
                    Icon(Icons.star,size: 14.sp,color: AppColors.primaryColor,),
                    Text("${mealModel.rate}",style: AppTextStyles.sandwichDesc,),
                  ],
                ),
              ),
            ),
            HeightSpace(27),
            Divider(thickness: .5,color: AppColors.greyFont,indent: 15.w,endIndent: 15.w,),
            HeightSpace(24),
            Text("Description",style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.bold),),
           HeightSpace(8),
            SizedBox(
                width: 340,
                height: 100,
                child: Text(mealModel.description,style: AppTextStyles.sandwichDesc,)),
            HeightSpace(30),
            Center(
              child: InkWell(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    btnOkText: "Ok",
                    title: 'Coming Soon!',
                    desc: 'This service will be available in future updates. Stay tuned!',

                  )..show();
                  },
                child: Container(
                  width: 300.w,
                  height: 40.h,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.primaryColor,
                  ),
                  child: Text(
                    "ORDER NOW",
                    style: AppTextStyles.cardTitle.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
