import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_text_styles.dart';
import '../../../widgets/spacing_widgets.dart';

class CarousalSliderWidget extends StatefulWidget {
   CarousalSliderWidget({required CarouselSliderController?controller,required int? currentIndex,super.key});

  @override
  State<CarousalSliderWidget> createState() => _CarousalSliderWidgetState();
}

class _CarousalSliderWidgetState extends State<CarousalSliderWidget> {
  List<String> titles=["Save Your Meals Ingredient","Use Our App The Best Choice"," Our App Your Ultimate Choice",];
  List<String> descriptions=["Add Your Meals and its Ingredients and we will save it for you","the best choice for your kitchen do not hesitate","All the best restaurants and their top menus are ready for you"];
  int currentIndex=0;
  CarouselSliderController controller=CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
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
    );
  }
}
