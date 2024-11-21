import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:taskatii/core/utils/colors.dart';
import 'package:taskatii/core/utils/text_Styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width = 250,
    this.height = 45,
    required this.text,
    this.bgColor,
    this.textColor,
    required this.onPressed,
  });

  final double width;
  final double height;
  final Color? bgColor;
  final Color? textColor;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: bgColor ?? AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: onPressed,
            child: Text(
              text,
              style: getBodyTextStyle(context,
                  color: textColor ?? AppColor.whiteColor),
            )));
  }
}