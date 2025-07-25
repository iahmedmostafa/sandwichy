import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSpace extends StatelessWidget {
 final double? height;
  const HeightSpace(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
    );
  }
}


class WidthSpace extends StatelessWidget {
  final double? width;
  const WidthSpace(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!.w,
    );
  }
}
