import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle heading4() {
  return TextStyle(
    color: AppColors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
}

TextStyle heading5() {
  return TextStyle(
      fontSize: 28.sp, color: AppColors.white, fontWeight: FontWeight.w700);
}

TextStyle bodyText1() => TextStyle(fontSize: 20.sp, color: AppColors.black);

TextStyle bodyText2() => TextStyle(fontSize: 23.sp, color: AppColors.black);

TextStyle bodyTextBold1() {
  return TextStyle(
      color: AppColors.black, fontSize: 20.sp, fontWeight: FontWeight.w700);
}

TextStyle headingBlack() {
  return TextStyle(
      fontSize: 28.sp, color: AppColors.textColor, fontWeight: FontWeight.w600);
}

TextStyle bodyTextBlue() {
  return TextStyle(
      fontSize: 28.sp, color: AppColors.lightBlue, fontWeight: FontWeight.w600);
}

TextStyle headingBlue() {
  return TextStyle(
      fontSize: 28.sp, color: AppColors.darkBlue, fontWeight: FontWeight.w600);
}

TextStyle headingBlackBig() {
  return TextStyle(
      fontSize: 32.sp, color: AppColors.textColor, fontWeight: FontWeight.w600);
}

TextStyle bodyBlack() {
  return TextStyle(
      fontSize: 28.sp, color: AppColors.textColor, fontWeight: FontWeight.w400);
}

TextStyle moneyText() {
  return TextStyle(
      fontSize: 30.sp, color: AppColors.textColor, fontWeight: FontWeight.w700);
}
