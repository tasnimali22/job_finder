import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';

class Rejected extends StatelessWidget {
  const Rejected({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AssetImageData.regested, fit: BoxFit.contain),
    );
  }
}
