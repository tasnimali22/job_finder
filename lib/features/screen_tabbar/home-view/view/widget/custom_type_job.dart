import 'package:flutter/material.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_time_type.dart';

class CustomTypeJobRow extends StatelessWidget {
  const CustomTypeJobRow({super.key, required this.style});
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTimeType(timeType: "Full time", style: style),
        CustomTimeType(timeType: 'onsite', style: style),
        CustomTimeType(timeType: 'Senior', style: style),
      ],
    );
  }
}
