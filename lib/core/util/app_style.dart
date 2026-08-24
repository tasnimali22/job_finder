import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

abstract class AppTextStyles {
  static const String _fontFamily = 'SF Pro Display';

  // Base Font Weights
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _bold = FontWeight.w700;

  // Heading 1 (32px)
  static TextStyle heading1Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32.0.sp,
    fontWeight: _regular,
  );
  static TextStyle heading1Medium = TextStyle(
    color: Colors.black,
    fontFamily: _fontFamily,
    fontSize: 32.0.sp,
    fontWeight: _medium,
  );
  static TextStyle heading1Mediumb = TextStyle(
    color: AppColors.primary500,
    fontFamily: _fontFamily,
    fontSize: 32.0.sp,
    fontWeight: _medium,
  );
  static TextStyle heading1Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32.0.sp,
    fontWeight: _bold,
  );

  // Heading 2 (28px)
  static TextStyle heading2Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: _regular,
  );
  static TextStyle heading2Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: _medium,
  );
  static TextStyle heading2Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: _bold,
  );

  // Heading 3 (24px)
  static TextStyle heading3Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: _regular,
  );
  static TextStyle heading3Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: _medium,
  );
  static TextStyle heading3Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.sp,
    fontWeight: _bold,
  );

  // Heading 4 (20px)
  static TextStyle heading4Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: _regular,
  );
  static TextStyle heading4Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: _medium,
  );
  static TextStyle heading4Mediumw = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: _medium,
  );
  static TextStyle heading4Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20.sp,
    fontWeight: _bold,
  );

  // Heading 5 (18px)
  static TextStyle heading5Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.sp,
    fontWeight: _regular,
  );
  static TextStyle heading5Medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.sp,
    fontWeight: _medium,
  );
  static TextStyle heading5Mediumw = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    fontSize: 18.sp,
    fontWeight: _medium,
  );
  static TextStyle heading5Mediumw15 = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _medium,
  );
  static TextStyle heading5Bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.sp,
    fontWeight: _bold,
  );

  // Text L (16px)
  static TextStyle textLRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: _regular,
  );
  static TextStyle textLRegularN = TextStyle(
    color: AppColors.neutral500,
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: _regular,
  );
  static TextStyle textLMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: _medium,
  );
  static TextStyle textLMediumW = TextStyle(
    color: AppColors.neutral900,
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: _medium,
  );
  static TextStyle textLBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.sp,
    fontWeight: _bold,
  );

  // Text M (14px)
  static TextStyle textMRegularp = TextStyle(
    color: AppColors.primary500,
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _regular,
  );
  static TextStyle textMRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _regular,
  );
  static TextStyle textMRegularn = TextStyle(
    color: AppColors.neutral400,
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _regular,
  );
  static TextStyle textMMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _medium,
  );
  static TextStyle textMMediumn = TextStyle(
    color: AppColors.neutral500,
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _medium,
  );
  static TextStyle textMMediump = TextStyle(
    color: AppColors.primary500,
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _medium,
  );
  static TextStyle textMBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.sp,
    fontWeight: _bold,
  );

  // Text S (12px)
  static TextStyle textSRegularb = TextStyle(
    color: AppColors.neutral600,

    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _regular,
  );
  static TextStyle textSRegular = TextStyle(
    color: AppColors.neutral400,
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _regular,
  );
  static TextStyle textSRegularw = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _regular,
  );
  static TextStyle textSRegularpr = TextStyle(
    color: AppColors.primary500,
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _regular,
  );
  static TextStyle textSMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _medium,
  );
  static TextStyle textSMediu = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _medium,
  );
  static TextStyle textSMediumw = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _medium,
  );
  static TextStyle textSBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.sp,
    fontWeight: _bold,
  );

  // Text XS (10px)
  static TextStyle textXSRegular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _regular,
  );
  static TextStyle textXSRegularn = TextStyle(
    color: AppColors.neutral400,
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _regular,
  );
  static TextStyle textXSMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _medium,
  );
  static TextStyle textXSMediump = TextStyle(
    color: AppColors.primary500,

    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _medium,
  );
  static TextStyle textXSBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10.sp,
    fontWeight: _bold,
  );
}
