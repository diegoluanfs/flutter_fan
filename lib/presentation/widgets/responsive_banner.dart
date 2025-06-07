import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveBanner extends StatelessWidget {
  final double maxWidth;
  final double deviceHeight;

  const ResponsiveBanner({
    super.key,
    required this.maxWidth,
    required this.deviceHeight,
  });

  @override
  Widget build(BuildContext context) {
    double bannerHeight = deviceHeight < 600 ? 64.h : 96.h;
    double fontSize = maxWidth < 400 ? 14.sp : 18.sp;

    return Container(
      width: maxWidth,
      height: bannerHeight,
      color: Colors.amber,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'Banner de Propaganda',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
