import 'package:carousel_slider/carousel_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/style/appColors.dart';

class DotsIndicatorWidget extends StatefulWidget {
  const DotsIndicatorWidget({required CarouselSliderController?controller,required int? currentIndex,super.key});

  @override
  State<DotsIndicatorWidget> createState() => _DotsIndicatorWidgetState();
}

class _DotsIndicatorWidgetState extends State<DotsIndicatorWidget> {
  int currentIndex=0;
  CarouselSliderController controller=CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return  DotsIndicator(
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
    );
  }
}
