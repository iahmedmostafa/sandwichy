import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sandwichy/core/style/app_text_styles.dart';
import 'package:sandwichy/widgets/spacing_widgets.dart';

class CustomFoodItem extends StatelessWidget {
 final String imageUrl;
 final String title;
 final double rate;
 final String time;
 final Function? onTap;

   CustomFoodItem({super.key,required this.imageUrl,required this.title,required this.rate,required this.time,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      width: 152.w,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r)
      ),
      child: Column(
        children: [
          SizedBox(
              height:106.h ,
              width:double.infinity ,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),

                ),
              ),),
          HeightSpace(8),
          Text(title,style: AppTextStyles.cardTitle,overflow: TextOverflow.ellipsis,maxLines: 2,),
          HeightSpace(16),
          Row(
            children: [
              Icon(Icons.star_rate,color: Colors.orange,),
              Text("$rate",style: AppTextStyles.cardReview,),
              WidthSpace(40),
              Icon(Icons.access_time_filled,color: Colors.orange,),
              Text(time,style: AppTextStyles.cardReview,),

            ],
          )

        ],
      ),
    );
  }
}
