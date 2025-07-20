import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sandwichy/core/asset/app_assets.dart';
import 'package:sandwichy/core/router/app_routes.dart';
import 'package:sandwichy/core/style/appColors.dart';
import 'package:sandwichy/core/style/app_text_styles.dart';
import 'package:sandwichy/feature/on_boarding/on_boarding_services.dart';
import 'package:sandwichy/feature/on_boarding/widgets/carousal_slider_widget.dart';
import 'package:sandwichy/feature/on_boarding/widgets/dots_indicator_widget.dart';
import 'package:sandwichy/widgets/spacing_widgets.dart';

class OnBoardingScreen extends StatefulWidget {

   OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   List<String> titles=["Save Your Meals Ingredient","Use Our App The Best Choice"," Our App Your Ultimate Choice",];

   List<String> descriptions=["Add Your Meals and its Ingredients and we will save it for you","the best choice for your kitchen do not hesitate","All the best restaurants and their top menus are ready for you"];

   int currentIndex=0;
  late CarouselSliderController controller; // مينفعش نعمل dispose
@override
  void initState() {
  controller=CarouselSliderController();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    bool isFirstTime = OnBoardingServices.isFirstTime();
    if (isFirstTime == true) {
      GoRouter.of(context).pushReplacementNamed(AppRoutes.onBoardingScreen);
      OnBoardingServices.setFirstTimeWithFalse();
    }
   else if (isFirstTime == false) {
      GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
    }
  });


    super.initState();
  }
  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(image: AssetImage(AppAssets.backGroundImage),fit: BoxFit.fill,)
          ),
            Positioned(
              bottom: 20.h,
              right: 32.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                width: 311.w,
                height: 430.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.9),
                  borderRadius: BorderRadius.circular(48.r)
                ),
                child: Column(
                  children: [
                  CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    height: 255.h,
                    viewportFraction:.9,
                    enlargeCenterPage: true,
                    onPageChanged: (index,reason){
                      setState(() {
                        currentIndex=index;
                      });
                    },
                  ),
                  items:List.generate(titles.length,(index){
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          child: Column(
                            children: [
                              Text(titles[index], style: AppTextStyles.onBoardingTitle,textAlign: TextAlign.center,),
                              HeightSpace(14),
                              Text(descriptions[index],style: AppTextStyles.onBoardingDesc,textAlign: TextAlign.center)
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                        size:  Size(16,4),
                        activeSize:  Size(16, 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        activeColor: AppColors.whiteColor,
                        color: AppColors.greyFont
                    ),
                    onTap: (index){
                      controller.animateToPage(index);
                      currentIndex=index;
                      setState(() {

                      });
                    },
                  ),

                    Spacer(),// take remaining free space
                   currentIndex>=2?InkWell(
                     onTap: (){
                       GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
                     },
                     child: Container(
                       width: 62.w,
                       height: 62.h,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: AppColors.whiteColor
                       ),
                       child: Icon(Icons.arrow_forward_sharp,color: AppColors.primaryColor,),

                     ),
                   ):
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: (){
                              GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
                            },
                            child: Text("Skip",style: AppTextStyles.onBoardingButton,)),
                        TextButton(
                            onPressed: (){
                              if(currentIndex<2){
                                currentIndex++;
                                controller.animateToPage(currentIndex);
                                setState(() {
                                });
                              }
                            },
                            child: Text("Next",style: AppTextStyles.onBoardingButton,))
                      ],
                    ),


                  ],
                ),
              ),
            )
        ],
      ),
        );
  }
}
