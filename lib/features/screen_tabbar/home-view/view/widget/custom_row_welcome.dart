import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';

class CustomRowWelcom extends StatelessWidget {
  const CustomRowWelcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("Hi, tasnim👋", style: AppTextStyles.heading3Medium),
            Text(
              "Create a better future for yourself ",
              style: AppTextStyles.textMMediumn,
            ),
          ],
        ),
        Image.asset(AssetImageData.notification, fit: BoxFit.contain),
      ],
    );
  }
}
