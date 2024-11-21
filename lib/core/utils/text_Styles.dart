import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle getTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColor.darkblueColor,
      fontSize: fontSize ?? 25,
      fontWeight: fontWeight ?? FontWeight.bold);
}

TextStyle getBodyTextStyle(BuildContext context, 
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColor.darkblueColor,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.bold);
}
TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColor.greyColor,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal);
}

