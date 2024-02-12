import 'package:cureways_user/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  final String center;
  const CustomCircularPercentIndicator(this.center,{super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 27.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 5.0,
      percent: 0.4,
      center: Text(
        "$center%",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0.sp, color: kWhite),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: kWhite,
      progressColor: kPrimaryColor.withOpacity(.5),
    );
  }
}
