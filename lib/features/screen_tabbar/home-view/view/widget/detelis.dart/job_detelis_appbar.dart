import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class JobDetelisAppbar extends StatelessWidget {
  const JobDetelisAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        Text("Job Detail", style: AppTextStyles.heading4Medium),
        IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
      ],
    );
  }
}
