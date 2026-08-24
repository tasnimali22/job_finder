import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_type_job.dart';

class AllJobs extends StatelessWidget {
  const AllJobs({
    super.key,
    required this.image,
    required this.nameJob,
    required this.compname,
    required this.location,
    required this.salary,
    required this.isSaved,
    required this.onSavedPressed,
  });
  final String image;
  final String nameJob;
  final String compname;
  final String location;
  final String salary;
  final bool isSaved;
  final VoidCallback onSavedPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Text(nameJob, style: AppTextStyles.heading5Medium),
          subtitle: Text(
            maxLines: 1,
            overflow: TextOverflow.clip,
            "$compname • "
            "$location",

            style: AppTextStyles.textXSRegular,
          ),
          trailing: IconButton(
            onPressed: onSavedPressed,
            icon: Icon(
              isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: isSaved ? AppColors.primary500 : AppColors.neutral400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTypeJobRow(style: AppTextStyles.textSRegularpr),
            Text(
              "$salary"
              r"$",
              style: AppTextStyles.textLMedium,
            ),
          ],
        ),
      ],
    );
  }
}
